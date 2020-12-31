class FlowsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_flow, only: [:update]

  def index
    @flows = Flow.all
    # @flows = Flow.where(prototype_id: params[:id])
  end

  def new
    # @flows = Flow.where(prototype_id: params[:id])
    # @flow = Flow.new(flow_params.merge(prototype_id: prototype_id))
    @flow = Flow.new
    @flow.prototype_id = params[:prototype_id]
    binding.pry
  end

  def create
    @flow = Flow.new(flow_params)
    # binding.pry
    # prototype_id = params[:id]
    # @flow = Flow.new(flow_params.merge(prototype_id: prototype_id))
    # @flow.processings.build
    if params[:back]
    render :new
    else
      if @flow.save
        redirect_to prototype_flow_path(params[:prototype_id], params[:prototype_id]), notice: "スケジュールを登録しました"
      else
        render :edit
      end
    end
  end

  def show
    @flows = Flow.where(prototype_id: params[:id])
  end

  def edit
    # @flows = Flow.all
    # @flows = Flow.where(prototype_id: params[:id])
    @flow = Flow.find(params[:id])
    # @flow.processings.build
  end

  def update
    if @flow.update(flow_params)
      redirect_to prototype_flow_path(params[:prototype_id], params[:prototype_id]), notice: "スケジュールを編集しました"
    else
      render :edit
    end
  end

  def destroy
    @flow = Flow.find(params[:id])
    @flow.destroy
    redirect_to prototype_flow_path(params[:prototype_id], params[:prototype_id]), notice:"スケジュールを削除しました"
  end

  def confirm
    @flow = Flow.new(flow_params)
    render :new if @flow.invalid?
  end

  private
  def flow_params
    params.require(:flow).permit(:prototype_id, :processing_id, :scheduled_starting_time, :scheduled_ending_time, :ending_time, :number)
    # params.permit(:prototype_id, :processing_id, :scheduled_starting_time, :scheduled_ending_time, :ending_time, :number)
    # params.permit(:scheduled_starting_time, :scheduled_ending_time, :ending_time, :number, processings_attributes:[:id, :processing_id])
    # params.require(:flow).permit(:scheduled_starting_time, :scheduled_ending_time, :ending_time, :number, processings_attributes:[:id, :processing_id])
    # params.permit(flows: {}).require(:flows)
  end

  def set_flow
    @flow = Flow.find(params[:id])
  end
end
