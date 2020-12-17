class FavoritesController < ApplicationController
  def create
    @shop = Shop.find(params[:shop_id])
    @review = Review.find(params[:review_id])
    favorite = current_user.favorites.new(review_id: @review.id)
    favorite.save
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    @review = Review.find(params[:review_id])
    favorite = current_user.favorites.find_by(review_id: @review.id)
    favorite.destroy
  end
end
