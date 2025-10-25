CREATE OR REPLACE FUNCTION NthHighestSalary(N INT) RETURNS TABLE (Salary INT) AS $$
BEGIN
  RETURN QUERY (
    WITH cte AS (
      SELECT e.id,
             e.salary,
             dense_rank() OVER(ORDER BY e.salary DESC) AS rank
        FROM Employee e)
    SELECT c.salary
      FROM cte c
     WHERE rank = N
     LIMIT 1
  );
END;
$$ LANGUAGE plpgsql;
