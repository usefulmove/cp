select
    s.user_id,
    round(count(*) filter (where c.action = 'confirmed') * 1. / count(*), 2)
        as confirmation_rate
from Signups s
left join
    Confirmations c using (user_id)
group by
    1;
