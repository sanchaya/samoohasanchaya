module ApplicationHelper

  def check_translate_path(menu_name)
    params[:controller] == menu_name ? 'active' : ''
  end

  def clean_link link
    link.gsub('_', '.')
  end

  def reader_sanchaya_link book
    "http://reader.sanchaya.net/" + book.book_description.barcode if book.book_description
  end

  def user_voted?(user,translation_id)
    user.vote_translations.where(fuel_translation_id: translation_id).exists? ? 'on' : 'off'
  end

end
