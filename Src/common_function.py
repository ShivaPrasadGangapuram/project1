import requests

def api_to_json(url):
    response=requests.get(url,headers={'Accept':'Application/json'})
    data_json=response.json()
    return data_json