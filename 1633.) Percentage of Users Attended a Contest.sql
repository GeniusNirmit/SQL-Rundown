SELECT
    Register.contest_id,
    ROUND(
        COUNT(DISTINCT Register.user_id) * 100 / (
            SELECT
                COUNT(user_id)
            FROM
                Users
        ),
        2
    ) AS percentage
FROM
    Register
GROUP BY
    Register.contest_id
ORDER BY
    percentage DESC,
    Register.contest_id;