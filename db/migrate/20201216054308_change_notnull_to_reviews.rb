class ChangeNotnullToReviews < ActiveRecord::Migration[5.2]
  def change
    change_column_null :reviews, :title, :string, false
  end
end
