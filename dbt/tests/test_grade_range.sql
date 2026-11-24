select *
from {{ ref('fact_student_performance') }}
where final_grade < 0
   or final_grade > 20