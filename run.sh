#!/bin/bash
COMMAND=$1
if [ "$COMMAND" == "create_local_data" ]; then
    echo "Создание локальных данных"
    python generate.py local_data
elif [ "$COMMAND" == "build_generator" ]; then
    echo "Сборка образа генератора"
    docker build -f Dockerfile.generator -t my_generator .

elif [ "$COMMAND" == "run_generator" ]; then
    echo "Запуск генератора"
    docker run --rm -v ./data:/data my_generator
elif [ "$COMMAND" == "build_reporter" ]; then
    echo "Сборка образа аналитика"
    docker build -f Dockerfile.reporter -t my_reporter .

elif [ "$COMMAND" == "run_reporter" ]; then
    echo "Запуск аналитика"
    docker run --rm -v ./data:/data my_reporter
else
    echo "Неизвестная команда '$COMMAND'./run.sh create_local_data\nДоступные команды: create_local_data"
    exit 1
fi
