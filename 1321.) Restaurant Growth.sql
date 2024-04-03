SELECT
    visited_on,
    SUM(amount) AS amount,
    ROUND((SUM(amount) / 7), 2) AS average_amount
FROM
    (
        SELECT DISTINCT
            visited_on,
            SUM(amount) OVER (
                ORDER BY
                    visited_on ROWS BETWEEN 6 PRECEDING
                    AND CURRENT ROW
            ) AS amount
        FROM
            (
                SELECT
                    visited_on,
                    SUM(amount) AS amount
                FROM
                    Customer
                GROUP BY
                    visited_on
            ) Sum
    ) Aggregate
GROUP BY
    visited_on
LIMIT
    100
OFFSET
    6;