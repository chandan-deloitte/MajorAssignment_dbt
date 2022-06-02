{{ config(materialized='table') }}


select a.code,month(a.NAV_DATE),avg(a.NAV),avg(a.REPURCHASE_PRICE),avg(a.SALE_PRICE)
from "MAJORASSIGNMENT"."MAJORASSIGNMENT"."NAVHISTORY" a
group by a.code,a.NAV_DATE
