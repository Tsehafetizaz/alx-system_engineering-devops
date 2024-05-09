#!/usr/bin/python3
"""
Module to fetch all hot posts titles from a given subreddit recursively.
"""

import requests


def recurse(subreddit, hot_list=[], after=None):
    """
    Recursively queries Reddit API to retrieve titles of all hot articles for a
    given subreddit. Returns a list of titles, or None if no valid posts or
    subreddit is found.
    """
    url = f"https://www.reddit.com/r/{subreddit}/hot.json"
    headers = {
        'User-Agent': 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:52.0) '
                      'Gecko/20100101 Firefox/52.0'
    }
    params = {'limit': 100, 'after': after}

    try:
        response = requests.get(url, headers=headers, params=params,
                                allow_redirects=False)
        if response.status_code != 200:
            return None

        data = response.json().get('data')
        children = data.get('children')
        if not children:
            return None

        for child in children:
            title = child.get('data', {}).get('title')
            if title:
                hot_list.append(title)

        after = data.get('after')
        if after is not None:
            return recurse(subreddit, hot_list, after)
        return hot_list if hot_list else None
    except requests.RequestException:
        return None


if __name__ == "__main__":
    import sys
    if len(sys.argv) < 2:
        print("Please pass an argument for the subreddit to search.")
    else:
        result = recurse(sys.argv[1])
        if result is not None:
            print(len(result))
        else:
            print("None")
