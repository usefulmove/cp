with aggregation as (
    select user_id,
           avg(case
               when activity_type = 'free_trial' then activity_duration
               else null
               end
           ) as trial_avg_duration,
           avg(case
               when activity_type = 'paid' then activity_duration
               else null
               end
           ) as paid_avg_duration
    from UserActivity
    group by user_id)

select user_id,
       round(trial_avg_duration, 2) as trial_avg_duration,
       round(paid_avg_duration, 2)  as paid_avg_duration
from aggregation
where paid_avg_duration is not null
order by user_id
