# ポートフォリオ

## Webアプリケーション名
### 福祉.net
## アプリケーション画像
|トップページ|説明ページ|
|---|---|
|![トップページ](https://user-images.githubusercontent.com/104083127/208344427-b328161c-f933-431a-a437-83c6a1366be4.png)|![説明ページ](https://user-images.githubusercontent.com/104083127/208346193-3d197766-1644-4502-a4cf-309e2bb8530c.png)|

|新規登録ページ|ログインページ|
|---|---|
|![新規登録ページ](https://user-images.githubusercontent.com/104083127/208349099-0712b837-86b1-4a03-a7dc-9254972b9f9d.png)|![ログインページ](https://user-images.githubusercontent.com/104083127/208349165-89f831d2-bbcb-4b02-8278-e590cdc8b6d3.png)|

|投稿記事の作成ページ|プロフィール編集ページ|
|---|---|
|![投稿記事の作成ページ](https://user-images.githubusercontent.com/104083127/208350234-0d57be91-189c-42f5-bb90-ef0b303f99d2.png)|![プロフィール編集ページ](https://user-images.githubusercontent.com/104083127/208350828-f254c575-c009-4da2-a871-7d90dc235b62.png)|

|投稿一覧ページ|検索結果ページ|ユーザーページ|
|---|---|---|
|![投稿一覧ページ](https://user-images.githubusercontent.com/104083127/208353498-1fa8fd15-fcc7-4a50-832a-84e340631674.png)|![検索結果ページ](https://user-images.githubusercontent.com/104083127/208351061-ee262c75-3fb9-45d1-908d-51f4cbfae11f.png)|![ユーザーページ](https://user-images.githubusercontent.com/104083127/208354171-317f5629-6e58-4a90-9220-1e2b9b19887c.png)|

## 公開先URL
[福祉.net](https://warm-tundra-44676.herokuapp.com/)
## アプリについて
**作成に至った経緯**
- 前職での経験から、福祉業界は情報を発信できる機会が少ないと感じたから
***
**できること**
- ユーザー登録すると、記事を作成し投稿することができます。
- 投稿した記事は、ユーザー同士で自由に閲覧でき、気に入った記事にはお気に入りを付けて、ユーザー同士、情報の共有が行えます。
***
**機能**
- ユーザーの登録/削除
- ユーザーのログイン/ログアウト
- ユーザープロフィールの編集
- 記事の作成/投稿/削除
- カテゴリー機能
  - 記事にカテゴリーを割り振ることができる 
- お気に入り機能（Ajax通信）
  - 記事にお気に入りを付けることができる
- 検索機能
  - 記事のタイトル・内容・カテゴリーから任意の情報を検索することができる
- paginate機能
***

 ## 環境
 - docker
   - [操作方法]()
 - 言語
   - Ruby --バージョン(2.7.6)
 - フレームワーク
   - Ruby on rails --バージョン（6.1.5.1）
 - データベース
   - Postgesql --バージョン（14）
## [Test](https://github.com/hayato-f/rails_tutrial_2nd/blob/main/README2.md)


## [dockerの操作方法]（https://github.com/hayato-f/rails_tutrial_2nd/blob/main/README3.md）
[dockerの操作方法](https://github.com/hayato-f/rails_tutrial_2nd/blob/main/README3.md)

# devcontainer for Ruby on Rails 6.1

Ruby on Rails 6.1 の開発環境用の [devcontainer](https://code.visualstudio.com/docs/remote/containers)

## 構成

docker compose で構成

- app: [ruby:2.7.6-bullseye](https://hub.docker.com/_/ruby)
- postgres: [postgres:14](https://hub.docker.com/_/postgres)

### 機能

- formatter:
  - Ruby: [rufo](https://github.com/ruby-formatter/rufo)
  - ERB: [erb-formatter](https://github.com/nebulab/erb-formatter)
  - HTML, CSS, JS: [Prettier](https://prettier.io/)
- Intellisense: [solargraph](https://github.com/castwide/solargraph)
- debugger: [ruby-debug-ide](https://github.com/ruby-debug/ruby-debug-ide), [debase](https://github.com/ruby-debug/debase)

## devcontainerの利用方法
※ devcontainer に必要なツールのインストールは[こちら](https://code.visualstudio.com/docs/remote/containers#_installation)


### このリポジトリを新規プロジェクトで利用する場合

1. VSCodeを開き、 `Reopen in Container` を実行す

### 既存のプロジェクトで利用する場合
1. このリポジトリをダウンロードし、任意のプロジェクトに以下をコピーする
- [docker-compose.yml](docker-compose.yml)
- [docker/app/Dockerfile](docker/app/Dockerfile)
- [.devcontainer](.devcontainer)
- [.vscode](.vscode)

2. VSCodeを開き、 `Reopen in Container` を実行する

## サーバーの立ち上げ方

#### devcontainer上で、コマンドを実行する
```bash
$ bin/rails s
```

#### devcontainer上で、 `デバッグを実行` を実行する(ショートカットキー: F5)

`デバッグを実行` を利用すると[VSCode Debugging](https://code.visualstudio.com/docs/editor/debugging)が利用可能

> デバッグを実行するためには `ruby-debug-ide` , `debase` gem のインストールが必要

## docker composeのみで実行する場合
VSCode以外の環境で開発する場合は、docker composeを利用することができる。 [Makefile](Makefile) コマンドが用意されている。各コマンドはHost OS上で実行する。

#### 初回構築
```
$ make build
```

#### サーバーを起動する
```
$ make serve
```


## VSCode extensions

- [rebornix.Ruby](https://marketplace.visualstudio.com/items?itemName=rebornix.Ruby)
- [castwide.solargraph](https://marketplace.visualstudio.com/items?itemName=castwide.solargraph)
- [elia.erb-formatter](https://marketplace.visualstudio.com/items?itemName=elia.erb-formatter)
- [redhat.vscode-yaml](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml)
- [jemmyw.rails-fast-nav](https://marketplace.visualstudio.com/items?itemName=jemmyw.rails-fast-nav)
- [aki77.rails-db-schema](https://marketplace.visualstudio.com/items?itemName=aki77.rails-db-schema)
- [hridoy.rails-snippets](https://marketplace.visualstudio.com/items?itemName=hridoy.rails-snippets)
- [kaiwood.endwise](https://marketplace.visualstudio.com/items?itemName=kaiwood.endwise)
- [VisualStudioExptTeam.vscodeintellicode](https://marketplace.visualstudio.com/items?itemName=VisualStudioExptTeam.vscodeintellicode)
- [esbenp.prettier-vscode](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)

## リファレンス

- [Visual Studio Code Doc - Developing inside a Container](https://code.visualstudio.com/docs/remote/containers)
- [VS Code Solargraph Extension](https://github.com/castwide/vscode-solargraph)
- [vscode-ruby debugger](https://github.com/rubyide/vscode-ruby/blob/main/docs/debugger.md)
