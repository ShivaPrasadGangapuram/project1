import earthquake
import universities
import database
import credentials

def lambda_handler(event, context):
    if event['modulename']=="earthquake":
        earthquake_features=earthquake.Disasters
        file_name=earthquake_features.earthqauke_api_to_s3(event)
        host,dbase,user,password,port=credentials.mysql_credentials()
        db_obj=database.Db
        connection,cursor=db_obj.mysql_connection(host,dbase,user,password,port)
        db_obj.earthquake_s3_to_stg(connection,cursor,file_name)
        db_obj.stored_procedure(connection,cursor,"BIDatamart.sp_earthquake()")
        return f"{event['modulename']} module is successfully completed"

    elif event['modulename']=="universities":
        university_data=universities.Education
        file_name=university_data.universities_api_to_s3(event)
        db_obj=database.Db
        connection,cursor=db_obj.mysql_connection()
        db_obj.univerisites_s3_to_stg(connection,cursor,file_name)
        db_obj.stored_procedure(connection,cursor,"BIDatamart.sp_univeristies()")
        return f"{event['modulename']} module is successfully completed"
    else:
        return f"{event['modulename']} module does not exit,enter valid module name"
