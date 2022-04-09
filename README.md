# nps_service

## Setup
* Create `.env.development` with following content
```
# Define ENV variables for development environment
DATABASE_URL=postgresql://postgres:example@db/nps_development
SERVE_STATIC_ASSETS="true"
WEB_SESSIONS_SECRET="abc"
```

* Run `make dockerize`. Successful output looks like:
```                                                                                                                                                                                                                     (master)nps
docker-compose up --build
Building web
[+] Building 26.1s (10/10) FINISHED
 => [internal] load build definition from Dockerfile                                                                                                                                                                                                     0.0s
 => => transferring dockerfile: 37B                                                                                                                                                                                                                      0.0s
 => [internal] load .dockerignore                                                                                                                                                                                                                        0.0s
 => => transferring context: 2B                                                                                                                                                                                                                          0.0s
 => [internal] load metadata for docker.io/library/ruby:2.6.9-alpine                                                                                                                                                                                     1.5s
 => [1/5] FROM docker.io/library/ruby:2.6.9-alpine@sha256:14c280549fd2bd7355c8c8d76b357760f90396c993ee1fa5d0e4fd9d0fa74e18                                                                                                                               0.0s
 => [internal] load build context                                                                                                                                                                                                                        0.0s
 => => transferring context: 39.88kB                                                                                                                                                                                                                     0.0s
 => CACHED [2/5] RUN apk add --no-cache build-base postgresql postgresql-dev libpq                                                                                                                                                                       0.0s
 => CACHED [3/5] WORKDIR /app                                                                                                                                                                                                                            0.0s
 => [4/5] COPY . /app                                                                                                                                                                                                                                    0.0s
 => [5/5] RUN bundle install -j $(nproc) --quiet                                                                                                                                                                                                        23.3s
 => exporting to image                                                                                                                                                                                                                                   1.2s
 => => exporting layers                                                                                                                                                                                                                                  1.2s
 => => writing image sha256:584f72b9a367db7febef14f15e64fab9ba8909db4c396b30573d85ff40ed8487                                                                                                                                                             0.0s
 => => naming to docker.io/library/nps_web                                                                                                                                                                                                               0.0s

Use 'docker scan' to run Snyk tests against images to find vulnerabilities and learn how to fix them
Starting nps_db_1 ... done
Recreating nps_web_1 ... done
Attaching to nps_db_1, nps_web_1
db_1   |
db_1   | PostgreSQL Database directory appears to contain a database; Skipping initialization
db_1   |
db_1   | 2022-04-09 06:34:46.321 UTC [1] LOG:  starting PostgreSQL 12.3 on x86_64-pc-linux-musl, compiled by gcc (Alpine 9.3.0) 9.3.0, 64-bit
db_1   | 2022-04-09 06:34:46.321 UTC [1] LOG:  listening on IPv4 address "0.0.0.0", port 5432
db_1   | 2022-04-09 06:34:46.321 UTC [1] LOG:  listening on IPv6 address "::", port 5432
db_1   | 2022-04-09 06:34:46.326 UTC [1] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
db_1   | 2022-04-09 06:34:46.345 UTC [23] LOG:  database system was interrupted; last known up at 2022-04-09 06:31:17 UTC
db_1   | 2022-04-09 06:34:46.702 UTC [23] LOG:  database system was not properly shut down; automatic recovery in progress
db_1   | 2022-04-09 06:34:46.704 UTC [23] LOG:  redo starts at 0/1650868
db_1   | 2022-04-09 06:34:46.704 UTC [23] LOG:  invalid record length at 0/1650998: wanted 24, got 0
db_1   | 2022-04-09 06:34:46.704 UTC [23] LOG:  redo done at 0/1650960
db_1   | 2022-04-09 06:34:46.719 UTC [1] LOG:  database system is ready to accept connections
web_1  | [2022-04-09 06:34:48] INFO  WEBrick 1.4.4
web_1  | [2022-04-09 06:34:48] INFO  ruby 2.6.9 (2021-11-24) [x86_64-linux-musl]
web_1  | [2022-04-09 06:34:48] INFO  WEBrick::HTTPServer#start: pid=1 port=2300
```

* While your docker container is running, connect to it from another terminal with command `make shell`. Successful output:
```
docker-compose exec web sh
/app #
```

* Run `hanami db create` and `hanami db prepare`

## Inspiration

* Dockerfile and Makefile https://github.com/gruz0/hanami-docker
