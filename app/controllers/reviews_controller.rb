class ReviewsController < ApplicationController

  def new
    @shop = Shop.find(params[:shop_id])
    @review = Review.new
  end

  def create
    @shop = Shop.find(params[:shop_id])
    @review = current_user.reviews.new(review_params)
    @review.shop_id = @shop.id
    # レビューを実装したら消す
    @review.rate = rand(5)
    if @review.save
      redirect_to shop_path(@shop.id)
    else
      render :new
    end
  end

  def edit
    @shop = Shop.find(params[:shop_id])
    @review = Review.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:shop_id])
    @review = Review.find(params[:id])

    if @review.update(review_params)
      redirect_to shop_path(@shop.id)
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to :root
  end

  def show
    @shop = Shop.find(params[:shop_id])
    @review = Review.find(params[:id])
  end

  def index
    @shop = Shop.find(params[:shop_id])
    @reviews = Review.all
  end

  private
  def review_params
    params.require(:review).permit(:review, :shop_id, :use_time, :visit_date, :bgm, :soloist, :space, :volume, :eyes, :busy , :title,  review_images_review_images: [])
  end
end