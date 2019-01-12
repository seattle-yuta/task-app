# docker-training-kit

1. イメージをビルド

```docker-compose build --no-cache```

2. webサーバのコンテナを開始する

```docker-compose run --rm web /bin/bash```

3. railsアプリケーションを作成する(node.js,webpack,vue.js)

```rails new . --webpack=vue --force --database=mysql```

4. webサーバのコンテナを終了する

```exit```

5. config/database.ymlの編集

``````

6. イメージをビルド（再）

```docker-compose build --no-cache```

7. コンテナを立ち上げる

```docker-compose up```

8. データベースの作成

```docker-compose run --rm web rails db:create```
