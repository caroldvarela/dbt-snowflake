with times as (
    select seq4() as hour
    from table(generator(rowcount => 24))
)
select
    hour as time_id,
    hour,
    case
        when hour between 6 and 11 then 'Morning'
        when hour between 12 and 17 then 'Afternoon'
        when hour between 18 and 21 then 'Evening'
        else 'Night'
    end as period_of_day
from times
order by hour