with customer_days_active as (
        select distinct
            customer_id,
            first_value(transaction_date)
                over(partition by customer_id order by transaction_date desc)
            -
            first_value(transaction_date)
                over(partition by customer_id order by transaction_date)
                as days_active
        from
            customer_transactions
    ),

    customer_refund_rate as (
        select
            customer_id,
            count(*) filter (where transaction_type = 'refund') * 1.0
            / count(*)
                as refund_rate
        from
            customer_transactions
        group by
            1
    ),

    meets_purchase_criterion as (
        select
            customer_id
        from
            customer_transactions
        where
            transaction_type = 'purchase'
        group by
            1
        having
            count(*) > 2
    ),

    meets_active_criterion as (
        select
            customer_id
        from
            customer_days_active
        where
            days_active >= 30
    ),

    meets_refund_criterion as (
        select
            customer_id
        from
            customer_refund_rate
        where
            refund_rate < 0.2
    )

select
    customer_id
from
    meets_purchase_criterion
where
    customer_id in (select customer_id from meets_active_criterion)
    and customer_id in (select customer_id from meets_refund_criterion)
order by
    1;
