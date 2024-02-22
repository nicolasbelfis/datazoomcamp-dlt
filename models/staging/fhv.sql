{{
    config(
        materialized='view'
    )
}}

with tripdata as 
(
  select *
  from {{ source('staging','fhv_2019') }}
)
select dispatching_base_num, SR_Flag, Affiliated_base_number,
    safe(DOlocationID as integer) as DOlocationID,
    cast(PUlocationID as integer) as PUlocationID,
    cast(pickup_datetime as timestamp) as pickup_datetime,
    cast(dropoff_datetime as timestamp) as dropoff_datetime,
from tripdata
