at first ,
you should remove the old image

- docker rmi $(IMAGE_NAME):$(VERSION)
if this command is not work, you should remove the old image
- docker ps -a
- docker rm container_id
- docker rmi image_name


build: ## Build docker image
- docker build -t $(IMAGE_NAME):$(VERSION) .
- docker build -t counting-app:0.1 .

- docker images
- docker image inspect counting-app:0.1 .

run: ## run docker image locally
	docker run -it $(IMAGE_NAME):$(VERSION)
- docker run -it counting-app:0.1

- docker run -d -p 9001:9001 counting-app:0.1

- docker tag SOURCE_IMAGE[:TAG] TARGET_IMAGE[:TAG]
- docker tag counting-app:0.1 counting-app:0.1

- docker tag counting-app:0.1 crackerp2k/docker-lab

- docker push crackerp2k/docker-lab:latest



## Run the Germany counting dashboard

Build both images from the repository root:

```sh
docker build -t counting-app:0.1 ./counting-app
docker build -t crackerp2k/germany-counting:0.1 ./germany-counting
```

Start the counting service and dashboard on the same Docker network:

```sh
docker network create germany-counting
docker run -d --name counting-app --network germany-counting counting-app:0.1
docker run -d --name germany-counting --network germany-counting -p 8001:80 crackerp2k/germany-counting:0.1
```

Open <http://localhost:8001>. If a container named `germany-counting` already
exists, remove that old container before running the dashboard command again.