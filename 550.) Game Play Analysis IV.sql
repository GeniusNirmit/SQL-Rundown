SELECT
    ROUND(
        COUNT(A1.player_id) / (
            SELECT
                COUNT(DISTINCT player_id)
            FROM
                Activity
        ),
        2
    ) AS fraction
FROM
    Activity A1
WHERE
    (
        A1.player_id,
        DATE_SUB (A1.event_date, INTERVAL 1 day)
    ) IN (
        SELECT
            player_id,
            MIN(event_date)
        FROM
            Activity
        GROUP BY
            player_id
    );