{{ config(materialized='view') }}

select
    int64_field_0 as Id,
    dispatching_base_num,
    cast(pickup_datetime as timestamp) as pickup_datetime,
    cast(dropOff_datetime as timestamp) as dropoff_datetime,
    cast(pulocationid as integer) as  pickup_locationid,
    cast(dolocationid as integer) as dropoff_locationi,
    cast(SR_Flag as integer) as SR_Flag,
    Affiliated_base_number
from
    {{ source('staging','fhv_data_2019') }}
    
-- dbt build --m <model.sql> --var 'is_test_run: false'
{% if var('is_test_run', default=true) %}

  limit 100

{% endif %}