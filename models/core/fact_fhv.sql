{{
    config(
        materialized='table'
    )
}}

select *
from {{ ref('fhv') }}
inner join {{ ref('dim_zones') }} as dz1 on {{ ref('dim_zones') }}.locationid = {{ ref('fhv') }}.PUlocationID
inner join {{ ref('dim_zones') }} as dz2 on {{ ref('dim_zones') }}.locationid = {{ ref('fhv') }}.DOlocationID
where dz1.borough != 'Unknown'
and dz2.borough != 'Unknown'
