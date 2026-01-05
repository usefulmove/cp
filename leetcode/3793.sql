with user_avgs as (
        select
            user_id,
            avg(tokens) as avg_tokens
        from
            prompts
        group by
            user_id
),

     one_prompt_greater_than_avg as (
        select distinct
            p.user_id
        from
            prompts p
        where
            tokens > (select u.avg_tokens
                      from user_avgs u
                      where p.user_id = u.user_id)
)

select
    user_id,
    count(*) as prompt_count,
    round(1. * sum(tokens) / count(*), 2) as avg_tokens
from
    prompts
where
    user_id in (select user_id
                from one_prompt_greater_than_avg)
group by
    user_id
having
    count(*) > 2
order by
    3 desc, 1;
