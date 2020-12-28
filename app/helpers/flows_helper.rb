module FlowsHelper
  def flow_choose_new_or_edit
    if action_name == 'new' || action_name == 'create'
      confirm_prototype_flows_path
    elsif action_name == 'edit'
      prototype_flow_path
    end
  end

  # def current_prototype_id
  #   @current_prototype_id = params[:id]
  # end
end
