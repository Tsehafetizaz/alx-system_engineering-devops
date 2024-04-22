#!/usr/bin/python3
"""Script that uses a REST API to return information about an employee's
TODO list progress for a given employee ID."""

import requests
import sys

if __name__ == '__main__':
    base_url = 'https://jsonplaceholder.typicode.com/'
    user_id = sys.argv[1]

    user = requests.get(f'{base_url}users/{user_id}').json()
    todos = requests.get(f'{base_url}todos', params={'userId': user_id}).json()

    completed = [task["title"] for task in todos if task.get('completed')]

    # Break the line to comply with PEP8 line length constraints
    message = (f"Employee {user.get('name')} is done "
               f"with tasks({len(completed)}/{len(todos)}):")
    print(message)
    for title in completed:
        print(f"\t {title}")
