{{
    config(
    materialized = 'table',
    )
}}

WITH fct_reviews AS (
    SELECT * FROM {{ ref('fct_reviews') }}
),
full_moon_dates AS (
    SELECT * FROM {{ ref('seed_full_moon_dates') }}
)
SELECT 
    r.*,
    CASE
        WHEN fm.full_moon_date IS NULL THEN 'Not Full Moon'
        ELSE 'Full Moon'
    END AS is_full_moon
FROM fct_reviews r
LEFT JOIN full_moon_dates fm
    ON (TO_DATE(r.review_date) = DATEADD(DAY, 1, fm.full_moon_date))