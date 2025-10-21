import polars as pl

def find_polarized_books(books: pd.DataFrame, reading_sessions: pd.DataFrame) -> pd.DataFrame:
    books = pl.from_pandas(books)
    reading_sessions = pl.from_pandas(reading_sessions)

    rating_summary = reading_sessions.group_by('book_id').agg(
        pl.col('session_rating').min().alias('min_rating'),
        pl.col('session_rating').max().alias('max_rating'),
        pl.col('session_rating').len().alias('num_ratings'),
        pl.when((pl.col('session_rating') <= 2) | (pl.col('session_rating') >= 4))
        .then(pl.lit(1))
        .otherwise(pl.lit(0))
        .sum().alias('extreme_ratings'),
        pl.when(pl.col('session_rating') <= 2)
        .then(pl.lit(1))
        .otherwise(pl.lit(0))
        .sum().alias('extreme_low'),
        pl.when(pl.col('session_rating') >= 4)
        .then(pl.lit(1))
        .otherwise(pl.lit(0))
        .sum().alias('extreme_high'),
    )

    rating_agg_complete = rating_summary.select(
        pl.col('book_id'),
        pl.col('num_ratings'),
        (pl.col('max_rating') - pl.col('min_rating')).alias('rating_spread'),
        (pl.col('extreme_ratings') / pl.col('num_ratings')).alias('polarization_score'),
        pl.col('extreme_low'),
        pl.col('extreme_high'),
    )

    result = books.join(rating_agg_complete, on='book_id').filter(
        pl.col('num_ratings') >= 5,
        pl.col('polarization_score') >= 0.6,
        (pl.col('extreme_low') > 0) & (pl.col('extreme_high') > 0),
    ).drop('num_ratings', 'extreme_low', 'extreme_high')

    return result.to_pandas()
