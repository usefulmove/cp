select
    pid.product_id,
    round(coalesce(sum(1. * u.units * p.price) / sum(u.units), 0), 2)
        as average_price
from
    UnitsSold u
left join
    Prices p on u.product_id = p.product_id
                and u.purchase_date between p.start_date and p.end_date
right join
    (select distinct product_id from Prices) pid
        on pid.product_id = u.product_id
group by
    1;
