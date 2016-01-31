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
    is_account = params['is_account']
    book_id  = params['book_id']
    library = params['library']
    respond_to do |format|
      if WikiUser.capture_wiki_user(book_name,is_account,user_name,book_id,library)
        format.json { head :ok }
      else
       format.json { head :error }
     end
   end
 end

end
