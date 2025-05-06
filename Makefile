.PHONY: build run clean test format lint local


build:
	docker build -t gpt2-api:latest .

run:
	docker run -d -p 8000:8000 --name gpt2-api-container gpt2-api:latest

stop:
	docker stop gpt2-api-container && docker rm gpt2-api-container

clean:
	docker rmi gpt2-api:latest

install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	python -m pytest -vv test_*.py

format:
	black *.py

lint:
	pylint --disable=R,C,E1120 *.py

local:
	uvicorn webapp.main:app --reload --host 0.0.0.0 --port 8000
