-- truncate and moving data from stagging.stg_univeristies  to BIDatamart.universities
create procedure BIDatamart.sp_universities()
begin
	truncate table BIDatamart.universities;
	insert into BIDatamart.universities
	  (  country,
	     alpha_two_code,
	     name,
	     state_province,
	     domains,
	     web_pages 
	    )
	 select  country,
	     alpha_two_code,
	     name,
	     state_province,
	     domains,
	     web_pages 
	 from staging.stg_universities;
end;

