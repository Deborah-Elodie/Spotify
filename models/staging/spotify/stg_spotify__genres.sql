with 

source as (

    select * from {{ source('spotify', 'genres') }}

),

renamed as (

    select
        date_date,
        country,
        position,
        streams,
        track_id,
        artists,
        artist_genres as genres,
        duration,
        explicit,
        name,
        macro_genres,
        country_name

    from source

)

select * from renamed