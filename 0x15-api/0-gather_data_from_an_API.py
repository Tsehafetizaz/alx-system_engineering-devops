#!/usr/bin/python3
import requests
import sys


def fetch_todo_progress(employee_id):
    """Fetch and display the TODO progress for a given employee ID."""
    user_base_url = "https://jsonplaceholder.typicode.com/users/"
    todos_base_url = "https://jsonplaceholder.typicode.com/todos?userId="

    user = requests.get(f"{user_base_url}{employee_id}").json()
    todos = requests.get(f"{todos_base_url}{employee_id}").json()

    completed_tasks = [todo for todo in todos if todo['completed']]
    total_tasks = len(todos)
    print(f"Employee {user['name']} is done with tasks"
          f"({len(completed_tasks)}/{total_tasks}):")
    for task in completed_tasks:
        print(f"\t {task['title']}")


if __name__ == "__main__":
    if len(sys.argv) > 1:
        fetch_todo_progress(int(sys.argv[1]))
