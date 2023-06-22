import requests
from datetime import date,timedelta

def api_to_json(url):
    response=requests.get(url,headers={'Accept':'Application/json'})
    data_json=response.json()
    return data_json

def start_end_dates(event):
    if event['startdate']=="" and event['enddate']=="":
        startdate=date.today() - timedelta(7)
        enddate=date.today() - timedelta(1)
    else:
        startdate=event['startdate']
        enddate=event['enddate']            
    return startdate,enddate


