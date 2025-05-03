WITH l AS (
    SELECT
        *
        FROM {{ ref('dim_listings_cleansed') }}
),
h AS (
    SELECT
        *
        FROM {{ ref('dim_hosts_cleansed') }}
)
SELECT
    l.listing_id,
    l.listing_name,
    l.room_type,
    l.minimum_nights,
    l.price,
    h.host_id,
    h.host_name,
    h.is_superhost as host_is_superhost,
    l.created_at,
    GREATEST(l.created_at, h.created_at) AS updated_at
FROM l
LEFT JOIN h
    ON l.host_id = h.host_id