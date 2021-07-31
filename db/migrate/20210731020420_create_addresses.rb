class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :postal_code,   null: false
      t.integer    :postage_type,    null: false
      t.string     :city
      t.string     :house_number
      t.string     :building_name
      t.string     :phone_number
    end
  end
end
