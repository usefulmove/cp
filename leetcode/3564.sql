with season_revenue_sales as (
        select *,
               price * quantity as revenue,
               case
                   when extract(month from sale_date) in (12, 1, 2)
                   then 'Winter'
                   when extract(month from sale_date) in (3, 4, 5)
                   then 'Spring'
                   when extract(month from sale_date) in (6, 7, 8)
                   then 'Summer'
                   when extract(month from sale_date) in (9, 10, 11)
                   then 'Fall'
                   else null
                end as season
        from sales),

    season_rank_agg as (
        select s.season,
               p.category,
               sum(s.quantity) as total_quantity,
               sum(s.revenue) as total_revenue,
               rank() over(partition by s.season order by sum(s.quantity) desc, sum(s.revenue) desc)
                   as season_rank
        from season_revenue_sales s
             left join products p on s.product_id = p.product_id
        group by 1, 2)

select season,
       category,
       total_quantity,
       total_revenue
from season_rank_agg
where season_rank = 1
order by season;
