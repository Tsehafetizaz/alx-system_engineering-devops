#!/usr/bin/python3
import requests
import json


def fetch_all_tasks():
    """Fetch and export tasks of all employees to a JSON file."""
    users_url = "https://jsonplaceholder.typicode.com/users"
    todos_url = "https://jsonplaceholder.typicode.com/todos"

    users = requests.get(users_url).json()
    todos = requests.get(todos_url).json()

    user_tasks = {}
    for user in users:
        filtered_tasks = [{
            "username": user['username'],
            "task": todo['title'],
            "completed": todo['completed']
        } for todo in todos if todo['userId'] == user['id']]
        user_tasks[str(user['id'])] = filtered_tasks

    with open("todo_all_employees.json", mode='w') as file:
        json.dump(user_tasks, file)


if __name__ == "__main__":
    fetch_all_tasks()
