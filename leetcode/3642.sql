with extreme_added as (
    from reading_sessions
    select
        *,
        extreme_rating: (case when session_rating >= 4 or session_rating <= 2 then 1 else 0 end)
),
rating_summary as (
    from extreme_added
    select
        book_id,
        num_ratings: count(*),
        num_extreme: sum(extreme_rating),
        min_rating: min(session_rating),
        max_rating: max(session_rating)
    group by book_id
)
from books b
    right join rating_summary r on b.book_id = r.book_id
select
    b.book_id,
    title,
    author,
    genre,
    pages,
    rating_spread: max_rating - min_rating,
    polarizaton_score: num_extreme / num_ratings
where
    num_ratings >= 5 and
    min_rating <= 2 and max_rating >= 4