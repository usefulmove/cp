with avg_prices as (
        select
            u.product_id,
            round(sum(1. * u.units * p.price) / sum(u.units), 2)
                as average_price
        from
            UnitsSold u
        left join
            Prices p on u.product_id = p.product_id
                and u.purchase_date between p.start_date and p.end_date
        group by
            1
)

select
    pid.product_id,
    coalesce(ap.average_price, 0) as average_price
from
    avg_prices ap
right join
    (select distinct p.product_id from Prices p) pid
        on ap.product_id = pid.product_id;
