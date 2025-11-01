select distinct
    first_value(person_name) over(order by cum_weight desc)
        as person_name
from (select person_name,
             sum(weight) over(order by turn) as cum_weight
      from Queue)
where cum_weight <= 1000;
