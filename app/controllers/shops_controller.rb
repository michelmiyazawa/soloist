class ShopsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :destroy]
  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.save!
    redirect_to shop_path(@shop.id), notice:"「登録しました」"
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    @shop.update(shop_params)
    redirect_to shop_path(@shop.id)
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def index
    @shops = Shop.all
  end

  def destroy
    @shop = Shop.find(params[:id])
    @shop.destroy
    redirect_to shops_path
  end


  private

  def shop_params
    params.require(:shop).permit(:name,:name_kana,:prefecture, :address, :zipcode ,:phonenumber,
    :hp, :regular_holiday, :opning_hours, :acsess, :parking, :seats, :payment, :facility, :genre_id, shop_images_images: [] )
  end
end
