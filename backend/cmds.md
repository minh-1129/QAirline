# docker commands

standing in the root folder of the project

## build and start the docker image
`docker compose --file ./backend/docker-compose.yml up --build`
`docker compose -f ./backend/docker-compose.yml up --build`

without goin in the postgres cli
`docker compose -f ./backend/docker-compose.yml up --build -d`

## start/stop the docker image
`docker compose --file ./backend/docker-compose.yml up/down`
`docker compose -file ./backend/docker-compose.yml up/down`

`docker compose -file ./backend/docker-compose.yml up -d`

if in the backend/ folder
`docker compose up/down`

## start/stop the webserver only
`docker compose --file ./backend/docker-compose.yml up/down webserver`
`docker compose -f ./backend/docker-compose.yml up/down webserver`

docker compose up/down webserver

## start/stop the database only
`docker compose --file ./backend/docker-compose.yml up/down db`
`docker compose -f ./backend/docker-compose.yml up/down db`

if in the backend/ folder
`docker compose up/down db (-d)`

## access to the database
`docker exec -it backend-db-1 psql -U postgres -d qairline -p 1802`