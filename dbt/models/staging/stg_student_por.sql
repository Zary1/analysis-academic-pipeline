{{ config(materialized='view') }}
select
school as school_code,
case 
    when sex='F' then 'Female'
    when sex ='M' then 'Male'
end as  gender,

cast(age as int) as age,

address,
famsize as family_size,

pstatus as parent_status,

cast(medu as int) as mother_education,

cast(fedu as int)  as father_education,

mjob as mother_job,

fjob as father_job,

reason as school_choice_reason,

guardian,

cast(traveltime as int) as travel_time,

cast(studytime as int) as study_time,

cast(failures as int) as failures,

case
    when schoolsup='yes' then 1
    else 0
end as school_support,

case
    when famsup ='yes' then 1
    else 0
end as family_support,

case 
    when paid= 'yes' then 1
    else 0
end as paid_classes,

case
    when activities='yes' then 1
    else 0
end as activities,

case
    when nursery = 'yes' then 1
        else 0
    end as attended_nursery,

    case
        when higher = 'yes' then 1
        else 0
    end as wants_higher_education,

    case
        when internet = 'yes' then 1
        else 0
    end as has_internet,

    case
        when romantic = 'yes' then 1
        else 0
    end as romantic_relationship,

 cast(famrel as int) as family_relationship_score,

    cast(freetime as int) as free_time_score,

    cast(goout as int) as social_life_score,

    cast(dalc as int) as workday_alcohol_consumption,

    cast(walc as int) as weekend_alcohol_consumption,

    cast(health as int) as health_score,

    cast(absences as int) as absences,

    cast(g1 as int) as first_period_grade,

    cast(g2 as int) as second_period_grade,

    cast(g3 as int) as final_grade

from {{ source('raw', 'student_por') }}