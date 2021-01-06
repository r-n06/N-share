# アプリ名
### N-share

## アプリの概要
美容に特化した投稿アプリケーション

## 制作背景
投稿系のサイトはたくさんありますが、ネイルに特化したものがなかった為、ネイルに関する情報のみを共有することを目的としました。また、各投稿にタグをつけることで検索しやすくしました。

## 要件定義
- ユーザー管理機能
  - ユーザー管理とユーザーの投稿を一覧で確認できるようにする為
    - 新規登録時にnicknameとemail、passwordを入力する。
    - 2回目以降はemailとpasswordでログインする。

- 投稿機能（写真付き）
  - 写真を投稿し、情報共有できるようにする為
    - 新規投稿時に写真とタイトル、説明を入れSENDボタンをクリックする。

- タグ機能
  - タグで投稿の内容をわかりやすくする為
    - 投稿時にタグ入力欄に付けたいタグ名を入力する。

- 検索機能
  - タグ名を入力し、数ある投稿から欲しい情報を絞る為
    - サイドバーにある検索バーにタグ名を入れ検索する。

- コメント機能
  - 閲覧者が気になる投稿にコメントし、投稿者とコミュニケーションをとレれるようにする為
    - 気になる投稿の詳細ページをクリックし、画面下部にあるコメント欄に入力し送信ボタンをクリックする。

- いいね機能
  - 気に入った投稿にいいねをし、後に一覧で表示できるようにする為
    - 各投稿にあるいいねボタンをクリックする。
    - マイページにあるいいねボタンをクリックすると今までいいねした投稿が一覧で表示される。

- フォロー機能
  - 気になる投稿者や友人など、繋がりたいユーザーをフォローすることで、フォローしたユーザーの詳細ページを閲覧できるようにする為
    - 気になる投稿の詳細ページにあるフォローをクリックする。

- アイコン表示機能
  - ユーザーのイメージを一目でわかるようにする為
    - ユーザー登録時に画像を選択するとアイコンの設定ができる。（選択しなくても登録可）
    - マイページの編集ボタンから画像の変更や追加ができる。

## 実装機能
- 新規投稿・編集・削除機能
- ユーザー管理機能（Gem：devise）
- タグ機能
- タグ検索機能
- いいね機能
- コメント機能
- ユーザー情報の編集機能

## 目指した課題解決
- ペルソナ：20代女性・おしゃれが好き・オフィスワーカー
- 課題：投稿系サイトにはジャンルに囚われず投稿できる反面、欲しい情報だけを得ることが難しいことが多いことです。
- 解決策：美容系に特化した投稿アプリケーションがあればより細かい情報をピンポイントに得られると考えました。

## 本番環境
- GitHub：https://github.com/r-n06/N-share
- Heroku：https://app-n-share.herokuapp.com/
  - テストアカウント
    - email：aa＠bb.com
    - password：test1234

## DEMO
### トップ画面
![トップ画面](https://user-images.githubusercontent.com/71483157/103710986-b231ef00-4ff9-11eb-8177-9a8bb4858892.png)

### 投稿画面
![投稿画面](https://user-images.githubusercontent.com/71483157/103711243-5caa1200-4ffa-11eb-8f82-d8c6363950c7.jpeg)

### 投稿詳細画面
![投稿詳細画面](https://user-images.githubusercontent.com/71483157/103711316-7f3c2b00-4ffa-11eb-89cc-ab5ce224cb44.jpeg)

### 編集画面
![編集画面](https://user-images.githubusercontent.com/71483157/103711509-f1ad0b00-4ffa-11eb-8386-27d32af71006.jpeg)

### ユーザー登録画面
![ユーザー登録画面](https://user-images.githubusercontent.com/71483157/103711430-c1fe0300-4ffa-11eb-9ba1-e19f9c468728.jpeg)

## 開発環境
- 言語：Ruby（2.6.5）, HTML, CSS
- フレームワーク：Ruby on Rails（6.0.0）
- DB：MySQL（5.6.50）

## 課題や今後実装したい機能
- フォロー機能
- アイコン表示機能

## DB設計
![DB設計](https://user-images.githubusercontent.com/71483157/98918885-84f12500-2511-11eb-8eaa-3c72c74aa68f.jpeg)