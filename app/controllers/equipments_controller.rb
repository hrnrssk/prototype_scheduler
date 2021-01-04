class EquipmentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_equipment, only: [:show, :edit, :update, :destroy]

  def index
    @equipments = Equipment.all
  end

  def new
      @equipment = Equipment.new
  end

  def create
    @equipment = Equipment.new(equipment_params)
    if params[:back]
    render :new
    else
      if @equipment.save
        redirect_to equipments_path, notice: "装置を登録しました"
      else
        render :new
      end
    end
  end

  def show
    # @flows = Flow.all.where(processing_id: params[:id])
    @flows = Flow.all.where(processing_id: @equipment.processings.ids)
  end

  def edit
  end

  def update
    if @equipment.update(equipment_params)
      redirect_to equipments_path, notice: "装置情報を編集しました"
    else
      render :edit
    end
  end

  def destroy
      @equipment.destroy
      redirect_to equipments_path, notice:"装置を削除しました"
  end

  def confirm
      @equipment = Equipment.new(equipment_params)
      render :new if @equipment.invalid?
  end

  private
  def equipment_params
      params.require(:equipment).permit(:name, :comment)
  end

  def set_equipment
      @equipment = Equipment.find(params[:id])
  end
end
