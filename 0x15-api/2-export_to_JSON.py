#!/usr/bin/python3
import requests
import json
import sys


def export_to_json(employee_id):
    """Export the tasks of a given employee to a JSON file."""
    user_base_url = "https://jsonplaceholder.typicode.com/users/"
    todos_base_url = "https://jsonplaceholder.typicode.com/todos?userId="

    user = requests.get(f"{user_base_url}{employee_id}").json()
    todos = requests.get(f"{todos_base_url}{employee_id}").json()

    tasks = [{
        "task": todo['title'],
        "completed": todo['completed'],
        "username": user['username']
    } for todo in todos]

    filename = f"{employee_id}.json"
    with open(filename, mode='w') as file:
        json.dump({str(employee_id): tasks}, file)


if __name__ == "__main__":
    if len(sys.argv) > 1:
        export_to_json(int(sys.argv[1]))
