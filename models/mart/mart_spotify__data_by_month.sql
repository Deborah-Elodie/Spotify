{{ config(materialized='table') }}
Select
    FORMAT_DATE('%Y-%m', date_date) AS year_month
    ,region
    ,country
    ,cat_genre
    ,potentiel_viral
    ,energy_vibe
    ,duration_segment
    ,count(distinct artist) as nb_artist
    ,count(distinct title) as nb_title
    ,count(distinct album) as nb_album
    ,sum(streams) as total_streams
    ,sum(popularity) as popularity
    ,sum(case 
    when is_explicit=True then 1 else 0 end) as nb_is_explicit
    ,sum(af_danceability) as sum_danceability
    ,avg(af_danceability) as avg_danceability
    ,sum(af_energy) as sum_energy
    ,avg(af_energy) as avg_energy
    ,sum(af_speechiness) as sum_speechiness
    ,sum(af_acousticness) as sum_acoustiness
    ,sum(af_instrumentalness) as sum_intrumentalness
    ,sum(af_valence) as sum_valence
    ,sum(af_tempo) as sum_tempo
FROM {{ ref('mart_spotify__data_by_day') }}
group by year_month
    ,country
    ,region
    ,cat_genre 
    ,potentiel_viral
    ,energy_vibe
    ,duration_segment
    order by year_month
