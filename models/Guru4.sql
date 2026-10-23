{{config(materialized='table')}}
select * from DB_ECOMM.SCH_ECOMM.USERS where COUNTRY != 'India'