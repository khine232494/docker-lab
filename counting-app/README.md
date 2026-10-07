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