{{ config(materialized='table') }}

select x.NAV_DATE,y.CODE,y.maximum
from "MAJORASSIGNMENT"."MAJORASSIGNMENT"."NAVHISTORY" x
join
(select a.CODE as code,max(b.NAV) as maximum
from "MAJORASSIGNMENT"."MAJORASSIGNMENT"."MUTUALFUND" a
join "MAJORASSIGNMENT"."MAJORASSIGNMENT"."NAVHISTORY" b on a.CODE=b.CODE group by a.CODE) y
where x.CODE=y.CODE and x.NAV=y.maximum

select x.NAV_DATE,y.CODE,y.minimum
from "MAJORASSIGNMENT"."MAJORASSIGNMENT"."NAVHISTORY" x
join
(select a.CODE as code,min(b.NAV) as minimum
from "MAJORASSIGNMENT"."MAJORASSIGNMENT"."MUTUALFUND" a
join "MAJORASSIGNMENT"."MAJORASSIGNMENT"."NAVHISTORY" b on a.CODE=b.CODE group by a.CODE) y
where x.CODE=y.CODE and x.NAV=y.minimum
