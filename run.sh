#!/bin/bash
COMMAND=$1
if [ "$COMMAND" == "create_local_data" ]; then
    echo "Создание локальных данных"
    python generate.py local_data
else
    echo "Неизвестная команда '$COMMAND'./run.sh create_local_data\nДоступные команды: create_local_data"
    exit 1
fi
