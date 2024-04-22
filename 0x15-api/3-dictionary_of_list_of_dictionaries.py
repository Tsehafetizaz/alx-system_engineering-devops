#!/usr/bin/python3
"""Exports to-do list information of all employees to JSON format."""
import json
import requests


def fetch_and_export_todos():
    base_url = "https://jsonplaceholder.typicode.com/"
    users_url = f"{base_url}users"
    todos_url = f"{base_url}todos"

    # Fetch users
    users = requests.get(users_url).json()

    all_todos = {}
    # Fetch todos for each user
    for user in users:
        user_id = user.get("id")
        todos = requests.get(todos_url, params={"userId": user_id}).json()
        all_todos[user_id] = [{
            "task": todo.get("title"),
            "completed": todo.get("completed"),
            "username": user.get("username")
        } for todo in todos]

    # Write to JSON file
    with open("todo_all_employees.json", "w") as jsonfile:
        json.dump(all_todos, jsonfile)


if __name__ == "__main__":
    fetch_and_export_todos()
