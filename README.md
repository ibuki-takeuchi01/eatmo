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