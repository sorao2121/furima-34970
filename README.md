## usersテーブル(ユーザー情報)

|Column----------|Type--|Options--------------|
|nickname--------|string|nul:false------------|
|email-----------|string|nul:false,unique:true|
|password--------|string|nul:false------------|
|first_ name-----|string|nul:false------------|
|family_name-----|string|nul:false------------|
|first_name_kana-|string|nul:false------------|
|family_name_kana|string|nul:false------------|
|birth_data------|data--|nul:false------------|

### Association
- has_many :items
- has_many :purchases

## itemsテーブル（商品情報）

|Column--------|Type---|Options--|
|user----------|references|nul:false,foreign_key: true|
|name----------|string----|nul:false------------------|
|description---|text------|nul:false------------------|
|category------|integer---|nul:false------------------|
|item_condition|integer---|nul:false------------------|
|postage_pay---|integer---|nul:false------------------|
|postage_type--|integer---|nul:false------------------|
|delivery_day--|integer---|nul:false------------------|
|price---------|integer---|nul:false------------------|
|trading_status|integer---|nul:false------------------|

### Association
- belongs_to :user
- has_one :purchases

## purchasesテーブル(購入情報)

|Column|Type------|Options--------------------|
|user--|references|nul:false,foreign_key: true|
|item--|references|nul:false,foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item
- has_one : delivery

## deliveryテーブル(配送情報)

|Column---------|Type------|Options--------------------|
|purchase-------|references|nul:false,foreign_key: true|
|post_code------|string----|nul:false------------------|
|prefecture_code|string----|nul:false------------------|
|city-----------|string----|nul:false------------------|
|house_number---|string----|nul:false------------------|
|building_name--|string----|nul:false------------------|
|phone_number---|string----|nul:false------------------|

### Association

- belongs_to :purchase