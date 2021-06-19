## usersテーブル(ユーザー情報)

|Column------------|Type--|Options--------------|
|nickname----------|string|null:false------------|
|email-------------|string|null:false,unique:true|
|encrypted_password|string|null:false------------|
|first_ name-------|string|null:false------------|
|family_name-------|string|null:false------------|
|first_name_kana---|string|null:false------------|
|family_name_kana--|string|null:false------------|
|birth_date--------|date--|null:false------------|

### Association
- has_many :items
- has_many :purchases

## itemsテーブル（商品情報）

|Column-----------|Type---|Options--|
|user-------------|references|null:false,foreign_key: true|
|name-------------|string----|null:false------------------|
|description------|text------|null:false------------------|
|category_id------|integer---|null:false------------------|
|item_condition_id|integer---|null:false------------------|
|postage_pay_id---|integer---|null:false------------------|
|postage_type_id--|integer---|null:false------------------|
|delivery_day_id--|integer---|null:false------------------|
|price------------|integer---|null:false------------------|

### Association
- belongs_to :user
- has_one :purchases

## purchasesテーブル(購入情報)

|Column|Type------|Options--------------------|
|user--|references|null:false,foreign_key: true|
|item--|references|null:false,foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item
- has_one : delivery

## deliveryテーブル(配送情報)

|Column------------|Type------|Options--------------------|
|purchase----------|references|null:false,foreign_key: true|
|post_code---------|string----|null:false------------------|
|prefecture_code_id|integer---|null:false------------------|
|city--------------|string----|null:false------------------|
|house_number------|string----|null:false------------------|
|building_name-----|string----|----------------------------|
|phone_number------|string----|null:false------------------|

### Association

- belongs_to :purchase