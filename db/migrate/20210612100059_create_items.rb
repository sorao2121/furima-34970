class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text :image
      t.string :item_name
      t.text :item_description
      
      t.timestamps
    end
  end
end
