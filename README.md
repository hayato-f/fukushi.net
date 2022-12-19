# ポートフォリオ

</br>

## Webアプリケーション名(公開先のリンク)
### [福祉.net](https://warm-tundra-44676.herokuapp.com/)
***
## アプリケーション操作画面
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

## アプリについて
**作成に至った経緯**
-  前職での経験から、福祉業界は情報を発信する機会が少ない業界であると感じた。Webサービスを利用して情報発信の機会が増えると、サービスの認知拡大や、支援の透明化につながると感じ、今回のアプリケーション開発に至った。
***
**できること**
- SNSアプリのように、自身の発信したい情報の投稿と共有ができる
- ユーザー登録すると、記事を作成し投稿することができる
- 投稿した記事は、ユーザー同士で自由に閲覧でき、気に入った記事にはお気に入りを付けて、ユーザー同士、情報の共有が行える
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
- 他のユーザーへメール送信機能
- paginate機能
***

 ## 開発環境
 - 言語
   - Ruby --バージョン(2.7.6)
 - フレームワーク
   - Ruby on rails --バージョン（6.1.5.1）
 - データベース
   - Postgesql --バージョン（14）
 - docker
   - 今回は下記の環境を使用した
   -  https://github.com/saboyutaka/ruby27-rails61-devcontainer
 - デプロイ先
   - heroku :https://warm-tundra-44676.herokuapp.com/ 
