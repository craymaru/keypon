module ApplicationHelper

  # BOOTSTRAP ACTIVE HELPERS
  def is_active_controller?(controller_name)
    params[:controller] == controller_name ? "active" : nil
  end

  def is_active_action?(action_name)
    params[:action] == action_name ? "active" : nil
  end

  def is_active_actions?(action_names)
    action_names.include?(params[:action]) ? "active" : nil
  end

  def is_active_controller_and_action?(controller_name, action_name)
    if params[:controller] == controller_name && params[:action] == action_name
      "active"
    else
      nil
    end
  end

  # ..END

end
