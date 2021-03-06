SERVICE_NAME=hello-world-printer
MY_DOCKER_NAME=$(SERVICE_NAME)

.PHONY: test deps test-api test_ui
.DEFAULT_GOAL := test

deps:
	pip install -r requirements.txt; \
	pip install -r test_requirements.txt;

lint:
	flake8 hello_world test

test:
	PYTHONPATH=. py.test --ignore=test_ui

test_cov:
	PYTHONPATH=. py.test --verbose -s --cov=. --ignore=test_ui

test_xunit:
	PYTHONPATH=. py.test -s --cov=. --junit-xml=test_results.xml --ignore=test_ui

test_ui:
	PYTHONPATH=. py.test -s --verbose test_ui/test_ui.py

test-api:
	python test-api/api_test.py

run:
	python main.py

codeclimate:
	codeclimate-test-reporter --file .coverage

docker_build:
	docker build -t $(MY_DOCKER_NAME) .

docker_run: docker_build
	docker run \
	--name $(SERVICE_NAME)-dev \
	 -p 5000:5000 \
	 -d $(MY_DOCKER_NAME)

test_smoke:
	curl -s -o /dev/null -w "%{http_code}" --fail 127.0.0.1:5000

test_smoke_siege_local:
	siege -t30s c2 http://127.0.0.1:5000

test_smoke_siege_heroku:
	siege -t30s c2 https://shielded-reef-85462.herokuapp.com/

USERNAME=addakowalczyk
TAG=$(USERNAME)/$(MY_DOCKER_NAME)

docker_push: docker_build
	@docker login --username $(USERNAME) --password $${DOCKER_PASSWORD}; \
	docker tag $(MY_DOCKER_NAME) $(TAG); \
	docker push $(TAG);\
	docker logout;
