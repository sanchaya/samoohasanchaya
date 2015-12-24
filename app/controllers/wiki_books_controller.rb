class WikiBooksController < ApplicationController

  def index
    @books = WikiBook.book_full_info
    respond_to do |format|
      format.json { render json: @books }
    end
  end


  def wiki_user_info
    book_name = params['book_name']
    user_name = params['user_name']
    respond_to do |format|
      if WikiUser.create(book_name: book_name, is_account: false, user_name: user_name)
        format.json { head :ok }
      else
       format.json { head :error }
     end
   end
 end

end
