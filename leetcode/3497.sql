with durations as (
  with paid_users as (
    with paid as (
      select
        user_id,
        sum(case when activity_type = 'paid' then 1 else 0 end)
          as ever_paid
        from UserActivity
       group by user_id)

    select user_id 
      from paid
     where ever_paid > 0)

  select
    user_id,
    (case when activity_type = 'free_trial' then activity_duration else null end)
      as trial_duration,
    (case when activity_type = 'paid' then activity_duration else null end)
      as paid_duration
    from
      UserActivity
   where
    user_id in (select user_id from paid_users))

select
  user_id,
  round(avg(trial_duration), 2) as trial_avg_duration,
  round(avg(paid_duration), 2) as paid_avg_duration
  from
    durations
 group by user_id
 order by user_id
