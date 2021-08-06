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
- has_many :orders






## itemsテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| price            | integer    | null: false                    |
| introduction     | text       | null: false                    |
| user             | references | null: false, foreign_key: true |
| category_id      | integer    | null: false                    |
| status_id        | integer    | null: false                    | 
| postage_id       | integer    | null: false                    |
| area_id          | integer    | null: false                    |
| shipping_id      | integer    | null: false                    |
| image            |            |                                |


### Association
- has_one :order
- belongs_to :user






## ordersテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- has_one :address
- belongs_to :user






## addressテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| order         | references | null: false, foreign_key: true |
| zip_code      | string     | null: false                    |
| area_id       | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    | 
| building_name | string     |                                |
| phone         | string     | null: false                    |

### Association
- belongs_to :order

