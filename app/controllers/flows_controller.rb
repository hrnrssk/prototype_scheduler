class FlowsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_flow, only: [:update]

  def index
    @flows = Flow.where(prototype_id: params[:prototype_id]).order(number: :ASC)
  end

  def new
    @flow = Flow.new
    @flow.prototype_id = params[:prototype_id]
    @flows = Flow.where(prototype_id: params[:prototype_id]).order(number: :ASC)
  end

  def create
    @flow = Flow.new(flow_params)
    @flow.prototype_id = params[:prototype_id]
    @flows = Flow.where(prototype_id: params[:prototype_id]).order(number: :ASC)
    if params[:back]
    render :new
    else
      if @flow.save
        redirect_to new_prototype_flow_path(params[:prototype_id]), notice: "スケジュールを登録しました"
      else
        # render :new
        # binding.pry
        # render "_worker"
        # render action: :_worker
        redirect_to new_prototype_flow_path(params[:prototype_id]), flash: { error: @flow.errors.full_messages }
      end
    end
  end

  def show
    @flows = Flow.where(prototype_id: params[:id]).order(number: :ASC)
  end

  def edit
    @flow = Flow.find(params[:id])
    @flows = Flow.where(prototype_id: params[:prototype_id]).order(number: :ASC)
  end

  def update
    if @flow.update(flow_update_params)
      redirect_to new_prototype_flow_path(params[:prototype_id]), notice: "スケジュールを編集しました"
    else
      @flows = Flow.where(prototype_id: params[:prototype_id]).order(number: :ASC)
      render :edit
    end
  end

  def destroy
    @flow = Flow.find(params[:id])
    @flow.destroy
    redirect_to new_prototype_flow_path(params[:prototype_id]), notice:"スケジュールを削除しました"
  end

  def confirm
    @flow = Flow.new(flow_params)
    render :new if @flow.invalid?
  end

  private
  def flow_params
    params.require(:flow).permit(:prototype_id, :user_id, :processing_id, :scheduled_starting_time, :scheduled_ending_time, :ending_time, :number)
  end

  def flow_update_params
    params.require(:flow).permit(:prototype_id, :processing_id, :scheduled_starting_time, :scheduled_ending_time, :ending_time, :number).merge(user_id: params[:processing][:user_id])
  end

  def set_flow
    @flow = Flow.find(params[:id])
  end
end
