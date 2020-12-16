module ProcessingsHelper
  def processing_choose_new_or_edit
    if action_name == 'new' || action_name == 'create'
        confirm_processings_path
    elsif action_name == 'edit'
        processing_path
    end
  end
end
