import pandas as pd
import csv
import json
from mysql import connector


class Db:
    def mysql_connection(host,dbase,user,password,port):
        connection=connector.connect(host=host,
                                        database=dbase,
                                        user=user,
                                        password=password,
                                        port=port)
        cursor=connection.cursor()
        return connection,cursor

    def earthquake_s3_to_stg(connection,cursor,filename):
        f_e=pd.read_csv(filename)
        data=json.loads(f_e.to_json(orient='records'))
        cursor.execute("truncate table staging.stg_earthquake;")
        connection.commit()
        for d in data:
            cursor.execute("insert into staging.stg_earthquake values (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)",list(d.values()) )        
        connection.commit()

    def univerisites_s3_to_stg(connection,cursor,filename):    
        df=pd.read_csv(filename)
        df.drop_duplicates(inplace=True)
        data=json.loads(df.to_json(orient='records'))
        cursor.execute("truncate table staging.stg_universities;")
        connection.commit()
        for d in data:
            cursor.execute("insert into staging.stg_universities(country,alpha_two_code,name,state_province,domains,web_pages) values(%s,%s,%s,%s,%s,%s)",list(d.values()))         
        connection.commit()
    def stored_procedure(connection,cursor,sp_name):
        cursor.execute(f"call {sp_name}")
        connection.commit()
     
 