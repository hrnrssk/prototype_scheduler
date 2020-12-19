class WorkingsController < ApplicationController
  def create
    @working = Working.create(user_id: current_user.id, processing_id: @processing.id)
  end

  def destroy
    @working = Working.find_by(user_id: current_user.id, processing_id: @processing.id)
    @working.destroy
  end

  private
  def set_processing
    @processing = Processing.find(params[:processing_id])
  end
end
