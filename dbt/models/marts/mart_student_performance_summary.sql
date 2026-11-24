{{ config(materialized='table') }}

select
school_key,
count(*) as tota_students,
avg(final_grade) as avarage_grade,
avg(absences) as avarage_absences,
avg(study_time) as avarage_study_time

from {{ref('fact_student_performance')}}
group by school_key