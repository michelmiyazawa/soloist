class ReviewsController < ApplicationController

  def new
    @shop = Shop.find(params[:shop_id])
    @review = Review.new
  end

  def create
    @shop = Shop.find(params[:shop_id])
    @review =current_user.reviews.new(review_params)
    @review.shop_id = @shop.id
    @review.save
    if @review.save
      redirect_to shop_path(@shop.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show

  end

  def index
  end

  private
  def review_params
    params.require(:review).permit(:review, :shop_id)
  end
end