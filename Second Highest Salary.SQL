WITH ranks as (
    SELECT
        salary,
        DENSE_RANK() OVER (ORDER BY salary DESC) as r
    FROM
        Employee
)

SELECT
    CASE WHEN count(*) > 1 THEN MAX(CASE WHEN r = 2 THEN salary END) ELSE null END as SecondHighestSalary
FROM
    ranks
