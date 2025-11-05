select customer_id
from Customer
group by 1
having count(distinct product_key) = (select
                                          count(distinct product_key)
                                      from Product)


select customer_id
from (select distinct
          customer_id, product_key
      from Customer
      order by 1, 2)
group by customer_id
having array_agg(product_key) = (select array_agg(product_key)
                                 from (select product_key
                                       from Product
                                       order by 1))
