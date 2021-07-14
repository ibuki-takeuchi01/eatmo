class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string   :title,      null: false
      t.float    :rate,       null: false
      t.text     :content,    null: false
      t.references :shop,     foreign_key: true
      t.references :user,     foreign_key: true
      t.timestamps
    end
  end
end