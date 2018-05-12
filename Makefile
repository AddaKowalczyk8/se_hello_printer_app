SERVICE_NAME=hello-world-printer
MY_DOCKER_NAME=$(SERVICE_NAME)

.PHONY: test
.DEFAULT_GOAL := test

deps:
	pip install -r requirements.txt; \
	pip install -r test_requirements.txt;
lint:
	flake8 hello_world test

test:
	PYTHONPATH=. py.test --ignore=test_ui

run:
	python main.py

docker_build:
	docker build -t $(SERVICE_NAME) .

docker_run: docker_build
	docker run \
	--name $(SERVICE_NAME)-dev \
	 -p 5000:5000 \
	 -d $(SERVICE_NAME)

test_smoke:
	curl --fail 127.0.0.1:5000

USERNAME=addakowalczyk
TAG=$(USERNAME)/$(SERVICE_NAME)

docker_push: docker_build
	@docker login --username $(USERNAME) --password $${DOCKER_PASSWORD}; \
	docker tag $(SERVICE_NAME) $(TAG); \
	docker push $(TAG);\
	docker logout;
