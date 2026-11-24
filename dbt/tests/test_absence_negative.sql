select *
from {{ ref('fact_student_performance') }}
where absences < 0