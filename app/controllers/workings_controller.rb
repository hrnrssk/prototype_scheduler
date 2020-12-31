class WorkingsController < ApplicationController
  def new
    @working = Working.new
  end
  
  def create
    @working = Working.create(user_id: current_user.id, processing_id: @processing.id)
  end

  def destroy
    @working = Working.find_by(user_id: current_user.id, processing_id: @processing.id)
    @working.destroy
  end

  # Ajax処理を行う処理
  def get_users
    render partial: 'worker', locals: {processing_id: params[:processing_id]}
  end

  private
  def set_processing
    @processing = Processing.find(params[:processing_id])
  end
end
