SELECT
    Visits.customer_id,
    COUNT(*) as count_no_trans
FROM
    Visits
    LEFT JOIN Transactions ON Transactions.visit_id = Visits.visit_id
WHERE
    Transactions.visit_id IS NULL
GROUP BY
    Visits.customer_id;