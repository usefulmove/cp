with summary as (
  select
    book_id,
    sum(case when session_rating <= 2 then 1 else 0 end) as extreme_lows,
    sum(case when session_rating >= 4 then 1 else 0 end) as extreme_highs,
    count(*) as ratings,
    max(session_rating) - min(session_rating) as rating_spread,
    sum(case when session_rating <= 2 or session_rating >= 4 then 1 else 0 end) as extreme_ratings
    from reading_sessions
   group by book_id),

  for_join as (
    select
      book_id,
      rating_spread,
      round(extreme_ratings * 1.0 / ratings, 2) as polarization_score
      from summary
     where ratings >= 5 and extreme_lows > 0 and extreme_highs > 0)

select *
  from books
       inner join for_join using (book_id)
 order by polarization_score desc, title desc ;
