with cross_prod as (select *
                      from Students
                           cross join Subjects),

  cross_exam as (select c.student_id,
                        c.student_name,
                        c.subject_name,
                        e.student_id as valid
                   from cross_prod c
                        left join Examinations e
                            on c.student_id = e.student_id
                            and c.subject_name = e.subject_name)

select student_id,
       student_name,
       subject_name,
       count(valid) as attended_exams
from cross_exam
group by 1, 2, 3
order by student_id,
         subject_name
