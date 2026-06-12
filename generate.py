import csv
import random
import os
import sys

NUM_ROWS = 50


COLUMNS = ["Workout_Name", "Day_Of_The_Week", "Room_Number", "Trainer"]

def generate_row():

    return {
        "Workout_Name": random.choice(["Йога", "Кроссфит", "Пилатес", "Зумба", "TRX", "Стретчинг"]),
        "Day_Of_The_Week": random.choice(["Понедельник", "Среда", "Пятница", "Суббота"]),
        "Room_Number": random.randint(1, 6),
        "Trainer": random.choice(["Александра", "Евгений", "Мария", "Дарья", "Андрей"])
    }

OUTPUT_DIR = sys.argv[1] if len(sys.argv) > 1 else "/data"
OUTPUT_FILE = os.path.join(OUTPUT_DIR, "data.csv")

os.makedirs(OUTPUT_DIR, exist_ok=True)

rows = [generate_row() for _ in range(NUM_ROWS)]

with open(OUTPUT_FILE, "w", newline="", encoding="utf-8") as f:
    writer = csv.DictWriter(f, fieldnames=COLUMNS)
    writer.writeheader()
    writer.writerows(rows)

