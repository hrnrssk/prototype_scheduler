class WorkingsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]

  def new
    @working = Working.new
  end
  
  def create
    @working = Working.create(user_id: current_user.id, processing_id: @processing.id)
  end

  def destroy
    @working = Working.find_by(id: params[:id])
    @working.destroy
    redirect_to user_path(current_user.id), notice:"担当工程を削除しました"
  end

  # Ajax処理を行う処理
  def get_users
    render partial: 'worker', locals: {processing_id: params[:processing_id]}
  end
end
