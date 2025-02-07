#!/bin/bash

cd /home/slightlywind/Repositories/khoj
docker-compose up --build &

OLLAMA_HOST=0.0.0.0:11434 OLLAMA_ORIGINS="*" ollama serve