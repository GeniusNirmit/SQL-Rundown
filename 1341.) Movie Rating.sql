(
    SELECT
        Users.name AS results
    FROM
        Users
        JOIN MovieRating ON Users.user_id = MovieRating.user_id
    GROUP BY
        Users.name
    ORDER BY
        COUNT(MovieRating.rating) DESC,
        Users.name
    LIMIT
        1
)
UNION ALL
(
    SELECT
        Movies.title AS results
    FROM
        Movies
        JOIN MovieRating ON Movies.movie_id = MovieRating.movie_id
    WHERE
        DATE_FORMAT (MovieRating.created_at, '%Y-%m') = '2020-02'
    GROUP BY
        Movies.title
    ORDER BY
        AVG(MovieRating.rating) DESC,
        Movies.title
    LIMIT
        1
);