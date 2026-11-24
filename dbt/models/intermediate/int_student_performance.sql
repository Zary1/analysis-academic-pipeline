{{ config(materialized='view') }}

select
*,
case
    when  final_grade >= 10 then 'Approved'
    else  'Failed'
    end as student_status,

case 
    when final_grade >=16 then 'Excelent'
    when final_grade >=14 then 'Good'
    when final_grade >=10 then 'Satisfactory'
    else 'At Risk'
end as perfomance_band

from {{ ref('stg_student_por') }}