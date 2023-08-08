#!/usr/bin/python3
''''Get first 10 hot posts'''
import requests


def top_ten(subreddit):
    '''Get top 10'''
    headers = {'User-agent': 'Unix:1-top_ten:v1'}
    response = requests.get('http://reddit.com/r/{}/hot.json'
                            .format(subreddit), headers=headers)
    posts = response.json().get('data', {}).get('children', {})
    if response.status_code != 200 or not posts:
        return print("None")
    for post in posts[0:10]:
        print(post.get('data', {}).get('title'))
