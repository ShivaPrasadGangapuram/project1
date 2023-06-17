import common_function
import json
import pandas as pd
import requests
import boto3
from io import StringIO
from datetime import date,timedelta


class Disasters: 
   
    def dates():
        yesterday = date.today() - timedelta(1)
        oneweek=date.today() - timedelta(7)
        return yesterday,oneweek
    
    yesterday,oneweek=dates()
       
    def earthqauke_api_to_s3(event,startdate=oneweek,enddate=yesterday):
        magnitude=event['magnitude']
        url=f"https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&starttime={startdate}&endtime={enddate}&minmagnitude={magnitude}"
        data_json=common_function.api_to_json(url)
        df=pd.json_normalize(data_json,record_path=['features'])
        df.rename(columns={"properties.type":"disaster_type","geometry.type":"location_type","type":"feature_type"},inplace=True)
        df.columns=df.columns.str.replace("properties."," ")
        df.columns=df.columns.str.replace("geometry."," ")
        csv_buffer=StringIO()
        df.to_csv(csv_buffer,index=False)
        client=boto3.client('s3')
        key=f"earthquake/earthquake_{startdate}_to_{enddate}.csv"
        Bucket='sampleapiproject'
        tos3=client.put_object(Body=csv_buffer.getvalue(),Bucket=Bucket,Key=key)
        return f"s3://{Bucket}/{key}"
