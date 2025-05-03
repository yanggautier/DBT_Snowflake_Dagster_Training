SELECT * FROM {{ ref('dim_listings_cleansed') }} l
INNER JOIN {{ ref('fct_reviews') }} f
USING (listing_id)
WHERE f.review_date <= l.created_at
