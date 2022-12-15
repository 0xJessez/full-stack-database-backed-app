# Anime Review / Search App

Search and review your favourite Anime titles. Users can sign-up and keep track of their own reviews whilst exploring reviews created by others. Configured as a full-stack database backed application using Ruby, SQL (Postgres DB), HTML, CSS. 

Try it out here - https://anime-review-search-app.fly.dev/

<img src='https://github.com/0xJessez/full-stack-database-backed-app/blob/main/anime-app.png' alt='final project design' width='900px' style='border: 1px solid'>

## About

The task at hand was to build and deploy a full-stack database backed application.

This anime app allows you to search for anime titles utilising the MAL public API (https://myanimelist.net/clubs.php?cid=13727). You then have the option of reviewing any title selected from the search function. When a review is created this populates a 'anime_reviews' table in the database in addition to 'anime_db' which stores information on titles which have been reviewed. This reduces the number of requests made to the API. 

## Planning

1. Layout
- Initial design of the layout and flow ([Initial Wireframing](https://github.com/0xJessez/full-stack-database-backed-app/tree/main/wireframe)) was completed in figma. This allowed me to visualise where each element would sit on the page and what database interaction would be needed.

2. Game plan to completion
- A combination of notes from initial figma planning and Trello management was used to dictate what tasks I complete to get to the finish line
<img src='https://github.com/0xJessez/full-stack-database-backed-app/blob/main/figma-layout.png' alt='figma design' width='450px'>
<img src='https://github.com/0xJessez/full-stack-database-backed-app/blob/main/trello-planning.png' alt='trello processes' width='450px'>

   
## Technology
- Ruby (Gems incl. Sinatra, Puma, PG, BCyrpt, HTTParty)
- SQL databases
- API requests
- HTML
- CSS

## Improvements
- Various CSS visual improvements can be made and are planned including mobile friendly view
- Allowing users to upload / update their own profile picture images (cloudinary implementation)