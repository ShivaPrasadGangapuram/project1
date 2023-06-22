
-- moving data from stagging.stg_earthquake to BIDatamart.earthquake
create procedure BIDatamart.sp_earthquake()
begin 
	DELETE FROM BIDatamart.earthquake where 
	BIDatamart.earthquake.id in 
	(SELECT staging.stg_earthquake.id from staging.stg_earthquake);
    
   insert into BIDatamart.earthquake
      (     feature_type,
	        id,
	        mag,
	        place,
	        occur_time,
	        updated,
	        tz,
	        url,
	        detail,
	        felt,
	        cdi,
	        mmi,
	        alert,
	        status,
	        tsunami,
	        sig,
	        net,
	        code,
	        ids,
	        sources,
	        types,
	        nst,
	        dmin,
	        rms,
	        gap,
	        magType,
	        disaster_type,
	        title,
	        location_type,
	        coordinates,
	        etl_processed_date
	     ) 
   select  feature_type,
	        id,
	        cast(mag as float),
	        place,
	        cast(occur_time as datetime),
	        cast(updated as datetime),
	        tz,
	        url,
	        detail,
	        cast(felt as float),
	        cast(cdi as float),
	        cast(mmi as float),
	        alert,
	        status,
	        cast(tsunami as unsigned int),
	        cast(sig as unsigned int),
	        net,
	        code,
	        ids,
	        sources,
	        types,
	        cast(nst as float),
	        cast(dmin as float),
	        cast(rms as float),
	        cast(gap as float),
	        magType,
	        disaster_type,
	        title,
	        location_type,
	        coordinates,
	        current_timestamp
	        from staging.stg_earthquake;
	       	       
end;



