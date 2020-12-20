class CreateReviewImages < ActiveRecord::Migration[5.2]
  def change
    create_table :review_images do |t|
      t.integer "review_id", null: false
      t.string "review_image_id"
      t.index ["review_id"], name: "index_review_images_on_review_id"
      t.timestamps
    end
  end
end
