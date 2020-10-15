SHELL := /bin/bash

base:
	docker build -t openpose_docker_base -f docker/DockerfileBase .
