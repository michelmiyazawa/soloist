class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def quit
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id]) 
    @user.destroy
    flash[:success] = 'ユーザーを削除しました。'
    redirect_to :root
  end

  private
  def user_params
    params.require(:user).permit(:name ,:profile_image, :sex, :date_of_birth, :introduction)
  end
end
