# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user_name          | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| birthday           | date   | null: false |

### Association
- has_many :items
- has_many :purchases






## itemsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| price         | integer    | null: false                    |
| introduction  | string     | null: false                    |
| user          | references | null: false, foreign_key: true |
| category      | string     | null: false                    |
| status        | string     | null: false                    | 
| postage       | string     | null: false                    |
| area          | string     | null: false                    |
| shipping_date | string     | null: false                    |

### Association
- has_one :purchase
- belongs_to :user






## purchasesテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- has_one :address






## addressテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| purchase      | references | null: false, foreign_key: true |
| card_number   | string     | null: false, foreign_key: true |
| card_deadline | date       | null: false                    |
| card_security | integer    | null: false                    |
| zip_code      | integer    | null: false                    |
| prefecture    | string     | null: false, foreign_key: true |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    | 
| building_name | string     |                                |
| phone         | string     | null: false                    |

### Association
- belongs_to :purchase