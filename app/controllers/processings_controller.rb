class ProcessingsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_processing, only: [:show, :edit, :update, :destroy]

  def index
    @processings = Processing.all
  end

  def new
      @processing = Processing.new
  end

  def create
    @processing = Processing.new(processing_params)
    if params[:back]
    render :new
    else
      if @processing.save
        redirect_to processings_path, notice: "工程を登録しました"
      else
        render :new
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    if @processing.update(processing_params)
      redirect_to processings_path, notice: "工程情報を編集しました"
    else
      render :edit
    end
  end

  def destroy
      @processing.destroy
      redirect_to processings_path, notice:"工程を削除しました"
  end

  def confirm
      @processing = Processing.new(processing_params)
      render :new if @processing.invalid?
  end

  private
  def processing_params
      params.require(:processing).permit(:name, :comment, :equipment_id, :time_required)
  end

  def set_processing
      @processing = Processing.find(params[:id])
  end
end
