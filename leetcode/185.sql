with ranked as (
  select
    departmentId,
    name,
    salary,
    dense_rank() over(partition by departmentId order by salary desc) as rank
    from Employee)

select d.name as Department,
       r.name as Employee,
       r.salary as Salary
  from ranked r
       left join Department d on r.departmentId = d.id
 where rank <= 3
