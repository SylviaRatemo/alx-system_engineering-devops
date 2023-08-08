#!/usr/bin/python3
''''Get hot posts'''
import requests


def recurse(subreddit, hot_list=[], after=None):
    '''Get hot posts'''
    headers = {'User-agent': 'Unix:2-recurse:v1'}
    limit = {'limit': 100}
    if isinstance(after, str):
        if after != "STOP":
            limit['after'] = after
        else:
            return hot_list
    response = requests.get('http://reddit.com/r/{}/hot.json'                            .format(subreddit), headers=headers, params=limit)
    if response.status_code != 200:
        return None
    posts = response.json().get('data', {})
    after = posts.get('after', 'STOP')
    if not after:
        after = "STOP"
    hot_list = hot_list + [post.get('data', {}).get('title')                           for post in posts.get('children', [])]
    return recurse(subreddit, hot_list, after)
