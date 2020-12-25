class ShopsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :destroy]
  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
     redirect_to shop_path(@shop.id), notice:"登録しました"
    else
      render :new
    end
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    @shop.update(shop_params)
    redirect_to shop_path(@shop.id), notice:"更新しました"
  end

  def show
    @shop = Shop.find(params[:id])
    genre_list = {
     "---":0,
     居酒屋:1,カレー:2,ラーメン:3,焼き肉:4,カフェ:5,鍋:6,寿司:7,
     魚介・海鮮:8,焼き鳥・鳥料理:9,和食:10,天ぷら:11,うどん・そば:12,すき焼き・しゃぶしゃぶ:13,おでん:14,
     お好み焼き・たこ焼き:15,ステーキ・ハンバーグ:16,鉄板焼:17,パスタ・ピザ:18,ハンバーガー:19,洋食:20,
     フレンチ:21,イタリアン:22,西洋各国料理:23,中華料理:24,
     韓国料理:25,バー:26,ファミレス:27,定食:28,丼もの:29,その他:30,
   }
    genre_list.map{|genre| @genre_name = genre[0] if genre[1] == @shop.genre_id}
    
    # レビューの平均点
    if @shop.reviews.blank?
      @average_review = 0
    else
      @average_review = @shop.reviews.average(:rate)
    end

    @shop_images = @shop.shop_images
  end

  def index
    @shops = Shop.all
    if @search
      @shops = @search.result(distinct: true)

    end

  end

  def destroy
    @shop = Shop.find(params[:id])
    @shop.destroy
    flash[:success] = '店舗を削除しました。'
    redirect_to shops_path
  end


  private

  def shop_params
    params.require(:shop).permit(:name,:name_kana,:prefecture, :address, :zipcode ,:phonenumber,
    :hp, :regular_holiday, :opning_hours, :acsess, :parking, :seats, :payment, :facility, :genre_id, shop_images_images: [] )
  end
end
