class AdminsController < ApplicationController
  before_action :authenticate_user!
  def index
    require 'csv'
    send_data(
      Book.to_csv,
      :type => 'text/csv',
      :filename => 'book.csv',
      :disposition => 'attachment'
      )
  end
end
