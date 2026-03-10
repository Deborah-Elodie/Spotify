SELECT 
m.*
,g.genres
FROM {{ ref('int_spotify__main_join') }} AS m
JOIN {{ ref('stg_spotify__genres') }} AS g 
USING (track_id)