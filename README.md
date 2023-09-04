# rails-postgresql-template

:warning: .git*, README.md, LICENSE は [新規アプリケーションの作成](#新規アプリケーションの作成) 実行時に削除されます。 :warning:

## 概要

* Rails x PostgreSQL のアプリケーションを作成、開発する際のテンプレート
* それぞれのバージョンは以下の通り
  * Ruby: `3.2.2`
  * Rails: `7.0.7.2`
  * PostgreSQL: `15.4`
* 利用には docker-cli が必要

## 使い方

### 新規アプリケーションの作成

1. 作成したいアプリ名で本リポジトリを clone
   * sample-app という名前のアプリを作成する場合、`git clone git@github.com:PongPieYah/rails-postgresql-template.git sample-app` を実行
1. `make new-app` を実行
   * アプリは直下のディレクトリに作成される
     * app, config, Gemfile といったディレクトリ、ファイルが docker ディレクトリと同階層となる
   * デフォルトでは `rails new . -f -d postgresql` でアプリを作成するが、`make new-app` 実行時に `CREATE_OPT` を指定することでその他のオプションも追加できる
     * 例) `make new-app CREATE_OPT=-c bootstrap -j webpack` のようにすると `rails new . -f -d postgresql -c bootstrap -j webpack` でアプリが作成される


### 開発用コンテナの立ち上げ

:warning: 既に[新規アプリケーションを作成](#新規アプリケーションの作成)している前提。 :warning:

1. `make .env` を実行
1. 作成された docker/.env にそれぞれの値を設定
1. `make up` を実行
1. (コンテナ停止時) `make down` を実行
