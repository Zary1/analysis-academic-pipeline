{{config(materialized='table')}}

select 
    row_number() over(order by school_code) as school_key, school_code

from(
    select distinct school_code
    from {{ref('stg_student_por')}}
)schools