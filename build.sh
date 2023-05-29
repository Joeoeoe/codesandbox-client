#!/bin/sh

npm config set registry https://registry.npm.taobao.org
yarn config set registry https://registry.npm.taobao.org

# 安装依赖
yarn

# 如果是第一次构建，需要先将整个项目构建一次，后面需要使用其中的构建产物
# 如果已经整体项目构建过一次，则无需重新构建
yarn run build 

# # 构建依赖库
# yarn run build:deps

# 进入到核心库 packages/app 进行构建
cd packages/app

yarn run build:sandpack-sandbox

# 由于一些原因，一些需要的静态文件需要从整体项目的构建目录中获取
# 因此需要在执行该 shell 脚本之前，将整个项目构建一次，即执行 yarn run build 即可（这个构建的时间会比较久）
cp -rf ../../www/static/* ./www/static
