{{ config(materialized='table') }}

select
   row_number() over(order by ds.school_key) as student_key,
    ds.school_key,
    isp.*

  

from {{ ref('int_student_performance') }} isp

left join {{ ref('dim_school') }} ds
    on isp.school_code = ds.school_code