with overbooked_weeks as (
        select
            employee_id,
            extract(week from meeting_date) as week,
            sum(duration_hours) as hours
        from
            meetings
        group by
            1, 2
        having
            sum(duration_hours) > 20
    ),

    overbooked_employees as (
        select
            employee_id,
            count(*) as meeting_heavy_weeks
        from
            overbooked_weeks
        group by
            1
        having count(*) > 1
    )

select
    oe.employee_id,
    e.employee_name,
    e.department,
    oe.meeting_heavy_weeks
from
    overbooked_employees oe
left join
    employees e using (employee_id)
order by
    4 desc, 2;
