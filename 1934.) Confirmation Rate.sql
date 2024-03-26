SELECT
    Signups.user_id,
    ROUND(
        IFNULL (AVG(Confirmations.action = 'confirmed'), 0),
        2
    ) AS confirmation_rate
FROM
    Signups
    LEFT JOIN Confirmations ON Signups.user_id = Confirmations.user_id
GROUP BY
    Signups.user_id;