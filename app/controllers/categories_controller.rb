class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    respond_to do |format|
      format.json { render json: @categories }
    end
  end

  def show
    @category = Category.find(params[:id])
    @category_books = Book.category_books(params[:id])#includes(:book_translations)
     respond_to do |format|
      format.json { render json: @category_books }
    end
  end
end
