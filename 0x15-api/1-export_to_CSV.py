#!/usr/bin/python3
import requests
import csv
import sys


def export_to_csv(employee_id):
    """Export the tasks of a given employee to a CSV file."""
    user_base_url = "https://jsonplaceholder.typicode.com/users/"
    todos_base_url = "https://jsonplaceholder.typicode.com/todos?userId="

    user = requests.get(f"{user_base_url}{employee_id}").json()
    todos = requests.get(f"{todos_base_url}{employee_id}").json()

    filename = f"{employee_id}.csv"
    with open(filename, mode='w', newline='') as file:
        writer = csv.writer(file, quoting=csv.QUOTE_ALL)
        for todo in todos:
            writer.writerow([employee_id, user['username'],
                             todo['completed'], todo['title']])


if __name__ == "__main__":
    if len(sys.argv) > 1:
        export_to_csv(int(sys.argv[1]))
