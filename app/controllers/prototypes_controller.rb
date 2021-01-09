class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_prototype, only: [:show, :edit, :update, :destroy]

  def index
    @prototypes = Prototype.all
    @q = Prototype.ransack(params[:q])
    @prototypes = @q.result(distinct: true)
    @flows = Flow.all
  end
  
  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if params[:back]
      render :new
    else
      if @prototype.save
        redirect_to new_prototype_path, notice: "試作品を登録しました"
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
    if @prototype.update(prototype_params)
      redirect_to prototypes_path, notice: "試作品情報を編集しました"
    else
      render :edit
    end
  end

  def destroy
    @prototype.destroy
    redirect_to prototypes_path, notice:"試作品を削除しました"
  end

  def confirm
    @prototype = Prototype.new(prototype_params)
    render :new if @prototype.invalid?
  end

  private
  def prototype_params
    params.require(:prototype).permit(:order_number, :customer, :name, :delivery_date)
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end
end
