class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :sex, :integer
    add_column :users, :date_of_birth, :date
    add_column :users, :introduction, :text
    add_column :users, :profile_image, :string
  end
end
