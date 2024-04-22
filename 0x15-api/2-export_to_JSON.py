#!/usr/bin/python3
"""Exports to-do list information for a given employee ID to JSON format."""

import json
import requests
import sys


def export_to_json(user_id):
    """Exports user's to-dos as JSON."""
    base_url = "https://jsonplaceholder.typicode.com/"
    user_response = requests.get(f"{base_url}users/{user_id}")
    user = user_response.json()
    username = user.get("username")

    todos_response = requests.get(
        f"{base_url}todos", params={"userId": user_id}
    )
    todos = todos_response.json()

    tasks = [{
        "task": todo.get("title"),
        "completed": todo.get("completed"),
        "username": username
    } for todo in todos]

    with open(f"{user_id}.json", "w") as jsonfile:
        json.dump({user_id: tasks}, jsonfile)


if __name__ == "__main__":
    if len(sys.argv) > 1:
        export_to_json(sys.argv[1])
