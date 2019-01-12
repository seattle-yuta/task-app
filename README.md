# 構築手順

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

# 追加インストール

1. Rspec

https://qiita.com/luckypool/items/e3662170033347510c3c

2. Guard

https://qiita.com/tbpgr/items/f5be21d8e19dd852d9b7

3. rspec-rails / guard-rspec

https://ruby-rails.hatenadiary.com/entry/20141021/1413819783

4. Vuex

https://vuex.vuejs.org/ja/installation.html

```yarn add vuex```

5. Vue-Router

https://router.vuejs.org/ja/installation.html

~~~
# Rails Server
npm install vue-router --save
~~~

6. CoreUI

https://github.com/coreui/coreui-vue/

~~~
# Rails Server
npm install @coreui/vue --save
~~~

7. graphQL

https://qiita.com/yuta-ushijima/items/6f800f20c83e79e6de64

~~~
# Gemfile
gem 'graphql'
~~~
  
~~~
# Rails Server
rails g graphql:install
~~~
  
8. Vue-Appllo

https://akryum.github.io/vue-apollo/guide/installation.html#vue-cli-plugin

~~~
# Rails Server
yarn add vue-apollo graphql apollo-client apollo-link apollo-link-http apollo-cache-inmemory graphql-tag
~~~

