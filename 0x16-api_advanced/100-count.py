#!/usr/bin/python3
"""
Module to count keyword occurrences in the titles of hot posts from a given
subreddit.
"""

import requests
import re
from collections import defaultdict


def count_words(subreddit, word_list, after=None, count_dict=None):
    """
    Recursively counts occurrences of each keyword in titles of hot posts
    from a subreddit, handling pagination and case insensitivity.
    """
    if count_dict is None:
        count_dict = defaultdict(int)

    headers = {
        'User-Agent': 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:52.0) '
                      'Gecko/20100101 Firefox/52.0'
    }
    params = {'after': after}
    url = f"https://www.reddit.com/r/{subreddit}/hot.json"

    try:
        response = requests.get(url, headers=headers, params=params,
                                allow_redirects=False)
        if response.status_code != 200:
            if not after:  # If it's the first request and it fails
                return
        else:
            data = response.json().get('data')
            posts = data.get('children', [])
            after = data.get('after')

            for post in posts:
                title = post.get('data', {}).get('title', "")
                for word in word_list:
                    # Matches words respecting boundaries
                    matches = re.findall(r'\b' + re.escape(word) + r'\b',
                                         title, re.IGNORECASE)
                    count_dict[word.lower()] += len(matches)

            if after is not None:
                return count_words(subreddit, word_list, after, count_dict)
            else:
                # Sorting and printing results
                sorted_words = sorted(
                    (word for word in count_dict if count_dict[word] != 0),
                    key=lambda x: (-count_dict[x], x))
                for word in sorted_words:
                    print(f"{word}: {count_dict[word]}")
    except requests.RequestException:
        pass


if __name__ == "__main__":
    import sys
    if len(sys.argv) < 3:
        print("Usage: {} <subreddit> <list of keywords>".format(sys.argv[0]))
        # To ensure the example command is under 79 characters
        example_cmd = "{} programming 'python java javascript'".format(sys.argv[0])
        # Break down long print statements if necessary
        print("Ex:", example_cmd[:39])
        print("    ", example_cmd[39:])
    else:
        count_words(sys.argv[1], [x.lower() for x in sys.argv[2].split()])
