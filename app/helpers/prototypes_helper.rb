module PrototypesHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'create'
      confirm_prototypes_path
    elsif action_name == 'edit'
      prototype_path
    end
  end
end
