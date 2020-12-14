class ShopsController < ApplicationController
  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.save!
    redirect_to shop_path(@shop.id), notice:"「登録しました」"
  end

  def edit
  end

  def update
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def index
  end

  def destroy
  end


  private

  def shop_params
    params.require(:shop).permit(:name,:name_kana,:prefecture, :address, :zipcode ,:phonenumber,
    :hp, :regular_holiday, :opning_hours, :acsess, :parking, :seats, :payment, :facility, :genre_id)
  end
end
