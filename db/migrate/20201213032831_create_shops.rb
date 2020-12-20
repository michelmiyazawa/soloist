class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :name, null: false
      t.string :name_kana, null: false
      t.integer :prefecture, null: false
      t.string :address, null: false
      t.string :zipcode, null: false
      t.string :phonenumber, null: false
      t.string :hp
      t.string :regular_holiday, null: false
      t.string :opning_hours, null: false
      t.string :acsess, null: false
      t.string :parking, null: false
      t.string :seats, null: false
      t.integer :payment
      t.integer :facility
      t.integer :genre_id, null:false
      t.timestamps
    end
  end
end
