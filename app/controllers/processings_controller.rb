class ProcessingsController < ApplicationController
  def show
    @working = current_user.workings.find_by(processing_id: @processing.id)
  end
end
