# docker-training-kit

1. docker-compose build --no-cache
2. docker-compose run --rm web /bin/bash
3. rails new . --webpack=vue --force --database=mysql
4. exit
5. config/database.ymlの編集

"default: &default
  adapter: mysql2
  encoding: utf8
  pool: 5
  username: root
  password: <%= ENV['MYSQL_ROOT_PASSWORD'] %>
  host: db

development:
  <<: *default
  database: myapp_development

test:
  <<: *default
  database: myapp_test"

6. docker-compose build --no-cache
7. docker-compose up
8. docker-compose run --rm web rails db:create
