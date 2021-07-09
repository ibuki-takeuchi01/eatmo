class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string  :shop_name,       null: false
      t.integer :genre_id,        null: false
      t.string :phone,           null: false
      t.integer :prefecture_id,   null: false
      t.string  :address,         null: false
      t.string  :traffic,         null: false
      t.string  :operating_hours, null: false
      t.integer :budget_id,       null: false
      t.integer :seat,            null: false
      t.text    :other
      t.references :owner,        foreign_key: true
      t.references :operation,    foreign_key: true
      t.timestamps
    end
  end
end
