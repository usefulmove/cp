with three_reviews_or_greater as (
        select
            employee_id
        from
            performance_reviews
        group by
            1
        having
            count(*) > 2
    ),

    ordered_reviews as (
        select
            employee_id,
            review_date,
            rating,
            row_number() over(partition by employee_id order by review_date desc)
                as most_recent
        from
            performance_reviews
        where
            employee_id in (select employee_id from three_reviews_or_greater)
    ),

    recent_three as (
        select
            employee_id,
            review_date,
            rating,
            most_recent,
            rating - lag(rating) over(partition by employee_id order by review_date)
                as rating_change
        from
            ordered_reviews
        where
            most_recent < 4
        )

select
    employee_id,
    name,
    sum(rating_change) as improvement_score
from
    recent_three
left join
    employees using (employee_id)
where
    most_recent < 3
group by
    1, 2
having 
    -- both scores higher than the previous
    count(*) filter (where rating_change > 0)  = 2
order by
    sum(rating_change) desc,
    name;
