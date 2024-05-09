#!/usr/bin/python3
"""Function to count words in all hot posts of a given Reddit subreddit."""
import requests


def count_words(subreddit, word_list, instances=None, after="", count=0):
    """Prints counts of given words found in hot posts of a given subreddit.
    Args:
        subreddit (str): The subreddit to search.
        word_list (list): The list of words to search for in post titles.
        instances (dict): Key/value pairs of words/counts.
        after (str): The parameter for the next page of the API results.
        count (int): Total number of words counted so far.
    """
    if instances is None:
        instances = {}
    url = f"https://www.reddit.com/r/{subreddit}/hot/.json"
    headers = {
        "User-Agent": "linux:0x16.api.advanced:v1.0.0 (by /u/bdov_)"
    }
    params = {"after": after, "limit": 100}

    try:
        response = requests.get(url, headers=headers, params=params,
                                allow_redirects=False)
        response.raise_for_status()  # Raises HTTPError for bad requests
        data = response.json().get("data")
    except requests.RequestException as e:
        print(f"Failed to retrieve data: {e}")
        return

    after = data.get("after")
    for child in data.get("children", []):
        title = child.get("data", {}).get("title", "").lower()
        words = title.split()
        for word in word_list:
            normalized_word = word.lower()
            instances[normalized_word] = instances.get(normalized_word, 0)
            + words.count(normalized_word)

    if after is not None:
        count_words(subreddit, word_list, instances, after, count)
    else:
        if instances:
            sorted_instances = sorted(
                instances.items(), key=lambda kv: (-kv[1], kv[0])
            )
            for key, value in sorted_instances:
                print(f"{key}: {value}")


if __name__ == "__main__":
    import sys
    if len(sys.argv) < 3:
        print("Usage: {} <subreddit> <list of keywords>".format(sys.argv[0]))
        sys.exit(1)
    count_words(sys.argv[1], sys.argv[2].split())
