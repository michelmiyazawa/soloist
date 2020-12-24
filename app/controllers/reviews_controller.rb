class ReviewsController < ApplicationController

  def new
    @shop = Shop.find(params[:shop_id])
    @review = Review.new
  end

  def create
    @shop = Shop.find(params[:shop_id])
    @review = current_user.reviews.new(review_params)
    @review.shop_id = @shop.id
    if @review.save
      redirect_to shop_review_path(@shop.id, @review.id), notice:"投稿しました"
    else
      render :new
    end
  end

  def edit
    @shop = Shop.find(params[:shop_id])
    @review = Review.find(params[:id])
    if @review.user.id == current_user.id
      render "edit"
    else
      redirect_to shop_reviews_path(@shop.id)
    end
  end

  def update
    @shop = Shop.find(params[:shop_id])
    @review = Review.find(params[:id])

    if @review.update(review_params)
      redirect_to shop_review_path(@shop.id, @review.id), notice:"更新しました"
    else
      render :edit
    end
  end

  def destroy
    @shop = Shop.find(params[:shop_id])
    @reviews = Review.page(params[:page]).reverse_order
    @review = Review.find(params[:id])
    if @review.user.id == current_user.id
      render "destroy"
    else
      redirect_to shop_reviews_path(@shop.id)
    end
    @review.destroy
    flash[:success] = '投稿を削除しました。'
    redirect_to shop_reviews_path(@shop.id)
  end

  def show
    @shop = Shop.find(params[:shop_id])
    @review = Review.find(params[:id])

  end

  def index
    @shop = Shop.find(params[:shop_id])
    # kaminari
    @reviews = Review.page(params[:page]).reverse_order
  end

  private
  def review_params
    params.require(:review).permit(:rate, :review, :shop_id, :use_time, :visit_date, :bgm, :soloist, :space, :volume, :eyes, :busy , :title,  review_images_review_images: [])
  end
end