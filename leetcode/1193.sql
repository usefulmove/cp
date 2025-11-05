select extract(year from trans_date) ||
           '-' ||
           to_char(extract(month from trans_date), 'FM00')
           as month,
       country,
       count(*) as trans_count,
       sum(case
               when state = 'approved'
               then 1
               else 0
           end) as approved_count,
       sum(amount) as trans_total_amount,
       sum(case
               when state = 'approved'
               then amount
               else 0
           end) as approved_total_amount
from Transactions
group by 1, 2;
