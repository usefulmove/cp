import pandas as pd

def count_salary_categories(accounts: pd.DataFrame) -> pd.DataFrame:
    accounts['Low Salary'] = accounts['income'] < 20000
    accounts['High Salary'] = accounts['income'] > 50000
    accounts['Average Salary'] = ~(accounts['Low Salary'] | accounts['High Salary'])

    agg = accounts.melt(id_vars='account_id', value_vars=['Low Salary', 'High Salary', 'Average Salary'])

    category_counts = agg.groupby('variable').sum()
    agg = category_counts.drop('account_id', axis='columns')

    agg = agg.reset_index()
    agg['category'] = agg['variable']
    agg['accounts_count'] = agg['value']
    agg = agg[['category', 'accounts_count']]

    return agg
