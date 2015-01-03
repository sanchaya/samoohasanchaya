module ApplicationHelper

  def check_translate_path(menu_name)
    params[:controller] == menu_name ? 'active' : ''
  end

end
