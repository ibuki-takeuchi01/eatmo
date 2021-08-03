
# アプリケーション名  
「動画で飲食店を探すなら EATMO」  

# アプリケーション概要  
動画でよりリアルな飲食店探し・飲食店PRを実現するwebサービスです。  

# URL  
 https://eatmo.herokuapp.com/  

# テスト用アカウント  
email:a@a.com   
pw:111qqq  

# 利用方法  
クライアント側：クライアント情報を登録し店舗登録より店舗の情報を登録できる。登録した内容は編集・削除ができます。  
カスタマー側：キーワード検索、エリア検索、口コミから店舗を探し動画とレビューでお店選びができます。  

# 目指した課題解決  
クライアント:店舗の料理、人、空間を動画で伝えることでより魅力的な店舗のPRをすることを目指しました。 
カスタマー:動画とレビューの二つの要素で店舗を探すことが出来るので失敗しないお店選びを実現することを目指しました。  

# 洗い出した要件定義

|機能     |目的     |詳細     |ストーリー（ユースケース）     |
|-------------------------------------------------------|
|DB設計   |        |         |                          |
|ユーザー管理機能     |deviseを用いたユーザー管理機能     |トップページ右上に新規登録、ログインボタンを表示させる、ログイン時はログアウトボタンを表示させる	レビューを投稿したいユーザーはログインが必要となる|  
|SNS認証     |ユーザーのSNSでの新規登録、ログイン     |SNSアカウント（Googleアカウン、Facabookアカウント）を利用したログイン方法を選択肢として追加する     |・ユーザーアカウントの登録方法を「手打ち入力」「Googleアカウントを利用」「Facabookアカウントを利用」の3つから選べるようにする  ・SNSアカウントを選択した場合、既にパスワードは入力されてる状態で表示される  |
|オーナー管理機能     |deviseを用いオーナー管理機能     |フッター上に登録・ログインボタンを表示させる     |店舗登録したいオーナーは登録・ログインが必要となる  |
|店舗登録機能     |飲食店の店舗登録機能     |動画、写真、アクセスなど店舗の詳細情報を入力することで登録できる     |トップページのフッターから店舗登録ができる  |
|店舗編集機能     |飲食店の店舗編集機能     |店舗詳細画面の右上から編集が可能     |  |	
|店舗削除機能     |飲食店の店舗削除機能     |店舗詳細画面の右上から削除が可能     |  |
|検索機能     |飲食店の検索機能     |トップページより検索が可能     |エリア情報とキーワード検索の2つから検索ができる  |
|星レビュー機能     |飲食店のレビュー機能     |ユーザーが飲食店に対して星評価を使用したレビューを投稿することができる	     |・投稿内容はトップページに反映され口コミから店舗探しができる  ・投稿したレビューが店舗詳細に評価点と口コミ件数で表示される  |
|複数枚画像登録     |ActiveStorageを使用した複数枚画像投稿機能     |店舗登録時に複数枚の画像添付が可能     |添付した画像は店舗詳細に表示される  |
|動画登録機能     |ActiveStorageを使用した動画投稿機能     |店舗登録時にPR動画の添付ができる     |  |	  

# 実装した機能についての画像やGIFおよびその説明  
[![Image from Gyazo](https://i.gyazo.com/69557fd5354fe80153e5be656957e492.gif)](https://gyazo.com/69557fd5354fe80153e5be656957e492)  

# 実装予定の機能  
・レビューいいね機能  
・javascriptライブラリ(Jquery,React)  
・マイページ  
・店舗保存機能  

# データベース設計  
[![Image from Gyazo](https://i.gyazo.com/ce78230f786842e5a383ea0bdbe8a22e.png)](https://gyazo.com/ce78230f786842e5a383ea0bdbe8a22e)



# テーブル設計

 ## users テーブル

 | Column              | Type    | Options                  |
 | ------------------- | ------- | ------------------------ |
 | nickname            | string  | null: false              |
 | email               | string  | null: false ,unique: true|
 | encrypted_password  | string  | null: false              |
 | prefecture_id       | integer | null: false              |
 | last_name           | string  | null: false              |
 | first_name          | string  | null: false              |
 | last_name_kana      | string  | null: false              |
 | first_name_kana     | string  | null: false              |
 | birth_date          | date    | null: false              |
 | image               | string  |                          |
 | profile             | text    |                          |
 
 ### Association
- has_many :reviews

 ## shops テーブル

 | Column             | Type       | Options                        |
 | ------------------ | ---------- | ------------------------------ |
 | shop_name          | string     | null: false                    |
 | genre_id           | integer    | null: false                    |
 | phone              | string     | null: false                    |
 | prefecture_id      | integer    | null: false                    |
 | address            | string     | null: false                    |
 | traffic            | text       | null: false                    |
 | operating_hours    | text       | null: false                    |
 | budget_id          | integer    | null: false                    |
 | seat               | integer    | null: false                    |
 | other              | text       |                                |
 | owner              | references | null: false, foreign_key: true |
 | operation          | references | null: false, foreign_key: true |

  ### Association
- belongs_to :owner
- belongs_to :operation
- has_many :reviews


 ## reviews テーブル

 | Column            | Type       | Options                        |
 | ----------------- | ---------- | ------------------------------ |
 | title             | string     | null: false                    |
 | rate              | float      | null: false                    |
 | content           | text       | null: false                    |
 | user              | references | null: false, foreign_key: true |
 | shop              | references | null: false, foreign_key: true |

 - belongs_to :user
 - belongs_to :shop

  ## owner テーブル

 | Column              | Type       | Options                        |
 | ------------------- | ---------- | ------------------------------ |
 | company             | string     |                                |
 | last_name           | string     | null: false                    |
 | first_name          | string     | null: false                    |
 | last_name_kana      | string     | null: false                    |
 | first_name_kana     | string     | null: false                    |
 | shop_name           | string     | null: false                    |
 | personal_phone      | string     | null: false                   |
 | email               | string     | null: false ,unique: true      |
 | encrypted_password  | string     | null: false                    |
 | shop                | references | null: false, foreign_key: true |
 | operation           | references | null: false, foreign_key: true |

   ### Association
- has_one :shop
- belongs_to :operation

  ## operation テーブル

 | Column              | Type       | Options                        |
 | ------------------- | ---------- | ------------------------------ |
 | last_name           | string     | null: false                    |
 | first_name          | string     | null: false                    |
 | last_name_kana      | string     | null: false                    |
 | first_name_kana     | string     | null: false                    |
 | email               | string     | null: false ,unique: true      |
 | encrypted_password  | string     | null: false                    |

   ### Association
- has_many :owners
- has_many :shops