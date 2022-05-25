# アプリケーション名

Gadget Expedition

# アプリケーション概要

自身のPC環境等を投稿し、ユーザー同士でコミュニケーションを取ることで、自分の理想のPC環境を発見することができる

# URL

http://35.78.49.125/

# テスト用アカウント

・ Basic認証パスワード：2222
・ Basic認証ID：admin
・ メールアドレス：sample@sample.com
・ パスワード：abcd1234

# 利用方法

1 トップページの新規登録ボタンからユーザー新規登録を行う
2 新規投稿ボタンから、投稿の内容（画像、費用、タイトル、コメント）を入力し投稿する
3 トップページの記事から記事詳細画面へ移動し記事についてコメントすることができる

# アプリケーションを作成した背景

私自身がPCを購入する際、何が必要でどのくらい費用がかかるか分かりにくく、どのようなレイアウトでPC環境を構築することができるのかイメージできないという課題があった。課題を解決するためより多くのPC環境を閲覧しイメージを掴み、大体の費用が予測できるSNSアプリケーションを開発することにした。

# 洗い出した要件

https://docs.google.com/spreadsheets/d/1tleEfz0r4nKI-bUnGstTbF5St43HsPc8B77YlxDyziw/edit?usp=sharing

# 実装予定の機能

今後下記内容を実装予定
・マイページ機能
・フォロー管理機能
・お気に入り管理機能

# データベース設計

https://gyazo.com/e7d8e888d498f8ad7cdc07bd48d4e942

# 画面推移図

https://gyazo.com/188042a63166579c6bd3b211cba85ef6

# 開発環境

・フロントエンド：HTML・CSS・Javascript
・バックエンド:Ruby・RubyonRails・MySQL
・インフラ:HEROKU・AWS.S3・AWS.EC2
・テスト:Rspec
・テキストエディタ:VScode
・タスク管理:GitHub

# ローカルでの動作方法

以下コマンドを順に実行
% git clone https://github.com/gadget.git
% cd gadget
% bundle install
% yarn install

# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique :true |
| encrypted_password | string | null: false               |

### Association

- has_many :articles
- has_many :favorites
- has_many :comments
- has_many :follows

## articles テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| title        | string     | null: false                    |
| text         | text       | null: false                    |
| image        | string     | null: false                    |
| price        | string     | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :favorites
- has_many :comments

## comments テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| text     | text       | null: false                    |
| user     | references | null: false, foreign_key: true |
| article  | references | null: false, foreign_key: true |

### Association

- belongs_to :article
- belongs_to :user

## favorites テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| article  | references | null: false, foreign_key: true |
| user     | references | null: false, foreign_key: true |

### Association

- belongs_to :article
- belongs_to :user

## follows テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
