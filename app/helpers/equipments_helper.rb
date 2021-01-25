module EquipmentsHelper
  def equipment_choose_new_or_edit
    if action_name == 'new' || action_name == 'create' || action_name == 'confirm'
      confirm_equipments_path
    elsif action_name == 'edit'
      equipment_path
    end
  end
end
