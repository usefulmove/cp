import pandas as pd

def find_books_with_no_available_copies(library_books: pd.DataFrame, borrowing_records: pd.DataFrame) -> pd.DataFrame:
    counts = pd.DataFrame(borrowing_records[borrowing_records['return_date'].isnull()].groupby(['book_id']).size())
    counts['current_borrowers'] = counts.iloc[:,0]
    
    books_join = library_books.merge(counts, left_on='book_id', right_index=True, how='left')

    out = books_join[books_join['total_copies'] == books_join['current_borrowers']]
    out = out[['book_id', 'title', 'author', 'genre', 'publication_year', 'current_borrowers']]
    out = out.sort_values(by=['current_borrowers', 'title'], ascending=[False, True])

    return out
