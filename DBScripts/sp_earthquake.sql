
-- moving data from stagging.stg_earthquake to BIDatamart.earthquake
create procedure BIDatamart.sp_earthquake()
begin  
   truncate table BIDatamart.earthquake;
   insert into BIDatamart.earthquake
      (     feature_type,
	        id,
	        mag,
	        place,
	        time,
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
	        coordinates
	  ) 
   select  feature_type,
	        id,
	        cast(mag as float),
	        place,
	        time,
	        updated ,
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
	        cast(nst as unsigned int),
	        cast(dmin as float),
	        cast(rms as float),
	        cast(gap as unsigned int),
	        magType,
	        disaster_type,
	        title,
	        location_type,
	        coordinates 
	        from staging.stg_earthquake;	
end;






