with nums as (
        select
            num,
            lag(num, 1) over() as num_2,
            lag(num, 2) over() as num_3
        from
            Logs
)

select distinct
    num as ConsecutiveNums
from
    nums
where
    num = num_2 and num = num_3;
