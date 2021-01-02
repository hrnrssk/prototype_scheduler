class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]


  def show
  end

  def edit
    @user.workings.build
  end

  def update
    if @user.update(user_params)
      redirect_to user_path, notice: "ユーザー情報を編集しました"
    else
      render :edit
    end
  end

  private
  def user_params
      params.require(:user).permit(:name, :email, workings_attributes:[:id, :processing_id])
  end

  def set_user
    @user = User.find(params[:id])
  end
end
