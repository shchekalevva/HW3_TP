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
elif [ "$COMMAND" == "structure" ]; then
    echo "Структура проекта"
    ls find .
elif [ "$COMMAND" == "clear_data" ]; then
    echo "Очистка данных"
    rm -f ./data/*.csv ./data/*.html
    echo "Папка data/ очищена"
elif [ "$COMMAND" == "inside_generator" ]; then
    echo "Просмотр файлов внутри генератора"
    docker run --rm -v ./data:/data my_generator ls -la /data
elif [ "$COMMAND" == "inside_reporter" ]; then
    echo "Просмотр файлов внутри аналитикa"
    docker run --rm -v ./data:/data my_reporter ls -la /data
else
echo -e "Неизвестная команда.\nДоступные: create_local_data, build_generator, run_generator, build_reporter, run_reporter, structure, clear_data, inside_generator, inside_reporter"
    exit 1
fi
