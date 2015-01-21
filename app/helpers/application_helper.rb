module ApplicationHelper

  def check_translate_path(menu_name)
    params[:controller] == menu_name ? 'active' : ''
  end

  def clean_link link
    link.gsub('_', '.')
  end
end
