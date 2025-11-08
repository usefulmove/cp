with first_and_latest_scores as (
        select distinct
            student_id,
            subject,
            first_value(score) over(
                partition by student_id, subject
                order by exam_date
            ) as first_score,
            last_value(score) over(
                partition by student_id, subject
                order by exam_date
                range between unbounded preceding and unbounded following
            ) as latest_score
        from
            Scores
)

select
    student_id,
    subject,
    first_score,
    latest_score
from
    first_and_latest_scores
where
    latest_score > first_score
order by
    1, 2;
