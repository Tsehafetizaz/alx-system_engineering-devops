#!/usr/bin/python3
"""Script to export data in the CSV format"""

import csv
import requests
import sys

# Constants
URL = "https://jsonplaceholder.typicode.com/"


def export_to_csv(user_id):
    """Exports user tasks to a CSV file."""
    user_url = f"{URL}users/{user_id}"
    todos_url = f"{URL}todos"

    # Fetch data from API
    user = requests.get(user_url).json()
    username = user.get("username")
    todos = requests.get(todos_url, params={"userId": user_id}).json()

    # Write data to CSV
    file_name = f"{user_id}.csv"
    with open(file_name, "w", newline="") as csvfile:
        writer = csv.writer(csvfile, quoting=csv.QUOTE_ALL)
        for todo in todos:
            writer.writerow([user_id, username, todo.get("completed"),
                             todo.get("title")])


if __name__ == "__main__":
    if len(sys.argv) > 1:
        export_to_csv(sys.argv[1])
