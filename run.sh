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
else
    echo "Неизвестная команда '$COMMAND'./run.sh create_local_data\nДоступные команды: create_local_data"
    exit 1
fi
