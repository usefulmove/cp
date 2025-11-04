select name,
       sum(amount) as balance
from Transactions
     left join Users using (account)
group by 1
having sum(amount) > 10000;
