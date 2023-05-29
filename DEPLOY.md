docker build --tag codesandbox-client:compile -f DockerFile.Client .   
docker run -it -dp 3002:3002 codesandbox-client:compile
