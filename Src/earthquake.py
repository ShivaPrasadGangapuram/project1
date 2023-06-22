import common_function
import json
import pandas as pd
import requests
import s3fs

class Disasters:    
    def earthqauke_api_to_s3(event,startdate,enddate):
        magnitude=event['magnitude']
        url=f"https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&starttime={startdate}&endtime={enddate}&minmagnitude={magnitude}"
        data_json=common_function.api_to_json(url)
        df=pd.json_normalize(data_json,record_path=['features'])
        df.rename(columns={"properties.type":"disaster_type","geometry.type":"location_type","type":"feature_type","properties.time":"occur_time"},inplace=True)
        df.columns=df.columns.str.replace("properties."," ")
        df.columns=df.columns.str.replace("geometry."," ")
        df['occur_time']=pd.to_datetime(df['occur_time']//1000, unit="s")
        df[' updated']=pd.to_datetime(df[' updated']//1000, unit="s")
        filename=f"s3://sampleapiproject/earthquake/earthquake_{startdate}_to_{enddate}.csv"
        df.to_csv(filename,index=False)
        return filename
