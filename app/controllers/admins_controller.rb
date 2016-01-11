class AdminsController < ApplicationController
  before_action :authenticate_user!

  def index

  end

  def download_book_info
    require 'csv'
    send_data(
      Book.to_csv,
      :type => 'text/csv',
      :filename => 'book.csv',
      :disposition => 'attachment'
      )
  end

  def download_categories
    require 'csv'
    send_data(
      Category.to_csv,
      :type => 'text/csv',
      :filename => 'category.csv',
      :disposition => 'attachment'
      )
  end
  
end
