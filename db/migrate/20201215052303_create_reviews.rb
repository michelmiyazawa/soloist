class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :user_id, null:false
      t.integer :shop_id, null:false
      t.float :rate, null:false, default: 0
      t.text :review
      t.string :bgm
      t.string :space
      t.string :volume
      t.string :eyes
      t.string :busy
      t.string :soloist
      t.date :visit_date
      t.integer :use_time
      t.timestamps
    end
  end
end