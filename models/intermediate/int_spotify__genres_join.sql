SELECT 
m.*
,g.cat_genre
FROM {{ ref('int_spotify__main_join') }} AS m
JOIN {{ ref('int_spotify__genres_agg') }} AS g 
USING (track_id)