import common_function
import json
import requests
import boto3
from io import StringIO
import pandas as pd
import s3fs

class Education:
    def universities_api_to_s3(event):
        data=[]
        country_name=event['country']
        for name in country_name:
            url=f"http://universities.hipolabs.com/search?country={name}"
            data_json=common_function.api_to_json(url)
            data+=data_json
        df=pd.DataFrame(data)
        df.rename(columns={"state-province":"state_province"},inplace=True)
        filename="s3://sampleapiproject/universities/universities.csv"
        df.to_csv(filename,index=False)
        return filename
        