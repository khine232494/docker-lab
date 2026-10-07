- ifconfig (or) ipaddr
- docker images
- docker ps
- docker network ls
- docker network inspect (name)
- docker volume ls
- docker volume inspect (name)


- pull the docker image from docker hub (hashicorp counting service and dashboard service)
-> docker pull hashicorp/counting-service:0.0.2 
-> docker pull hashicorp/dashboard-service:0.0.4

- docker network inspect bridge
- docker run -d --name counting \
  -p 9001:9001 \
  -e PORT=9001 \
  hashicorp/counting-service:0.0.2

- docker run -d --name dashboard \
  -p 9002:9002 \
  -e PORT=9002 \
  -e COUNTING_SERVICE_URL=http://counting:9001 \
  hashicorp/dashboard-service:0.0.4
- docker ps
- curl http://localhost:9001
- docker network inspect bridge

- if you want to stop docker, use this command 
-> docker stop (container name)

- and then remover the container,
-> docker rm (container name)

### if you want to remove the container and the image, use this command
-> docker rmi (image id)


### create compose.yaml file
and then run this command
-> docker-compose up
--> check the dashboard service

### if you want to stop the docker-compose, use this command
-> docker-compose down
