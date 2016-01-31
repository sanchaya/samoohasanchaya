class WikiUser < ActiveRecord::Base
#<WikiUser id: nil, is_account: nil, book_name: nil, user_name: nil, was_present: nil, is_present: nil, created_at: nil, updated_at: nil>

# When user clicks on create account on wiki
#is_account: to capture users have their account on wiki and book_name: to capture on which book they click the link

#When user submit after article creation
#is_account: captures user already has an account, user_name: which user_id, book_name: on which book
#was_present: if anybody already created an article by looking at book_name and user not null and is_present is not null.
#is_present: checks if article got created on wiki
#book_id and library is just for the reference with Samooha DB


  def self.capture_wiki_user(book,is_account,user,book_id=nil,library=nil)
    if is_account == false or is_account == 'false'
      create(book_name: book, is_account: is_account)
    else
      was_present = was_article_present?(book)
      is_present = WikiBook.check_book_in_wiki(book)
      create(book_name: book, is_account: is_account, user_name: user, was_present: was_present, is_present: is_present, book_id: book_id, library: library)
    end
  end


  def self.was_article_present?(article)
    article_found = where('book_name = ? and user_name is not null and is_present is not null', article).first
    article_found ? true : false 
  end

end
