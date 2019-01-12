# 1. 構築手順

  1. イメージをビルド

```docker-compose build --no-cache```

  2. webサーバのコンテナを開始する

```docker-compose run --rm web /bin/bash```

  3. railsアプリケーションを作成する(node.js,webpack,vue.js)

```rails new . --webpack=vue --force --database=mysql```

  4. webサーバのコンテナを終了する

```exit```

  5. config/database.ymlの編集

  ~~~
  default: &default
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
    database: myapp_test
  ~~~
    
  6. イメージをビルド（再）

```docker-compose build --no-cache```

  7. コンテナを立ち上げる

```docker-compose up```

  8. データベースの作成

```docker-compose run --rm web rails db:create```

---

# 2. テスト自動化

  1. Rspec

https://qiita.com/luckypool/items/e3662170033347510c3c

  2. Guard

https://qiita.com/tbpgr/items/f5be21d8e19dd852d9b7

  3. rspec-rails / guard-rspec

https://ruby-rails.hatenadiary.com/entry/20141021/1413819783

# 3. vue.js 拡張

  1. vuex

https://vuex.vuejs.org/ja/installation.html

  2. vue-router

https://router.vuejs.org/ja/installation.html

  3. coreui for vue

https://github.com/coreui/coreui-vue/

# 4. API

  1. graphQL (API Server)

https://qiita.com/yuta-ushijima/items/6f800f20c83e79e6de64
  
  2. Vue-Appllo (API Client)

https://akryum.github.io/vue-apollo/guide/installation.html#vue-cli-plugin

