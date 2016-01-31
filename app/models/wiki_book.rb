class WikiBook < ActiveRecord::Base
  BASE_URL = 'http://kn.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&exintro=&explaintext=&titles=' 

  def self.book_full_info
    klass = ['DliBook','Book'].sample
    present_in_wiki = klass.constantize.present_wiki_books.pluck('book_id')
    book = klass.constantize.where("id not in (?)", present_in_wiki.blank? ? [0] : present_in_wiki).order('RAND()').first
    book.get_full_info
    # Book.first.get_full_info
  rescue 
    p 'Exception'
    return false
  end

  def self.wiki_books
    ['DliBook','Book'].each do |book_class|
      books = book_class.constantize.all
      books.each do |book|
        @@book_name = book.book_translations.first.book_title
        wiki_book_present = check_book_in_wiki(@@book_name)
        create_wiki_book(book,wiki_book_present)
      end
    end
  end

  def self.osmania_wiki_books
    WikiBook.where(library: 'Osmania')
  end

  def self.dli_wiki_books
    WikiBook.where(library: 'Dli')
  end

  def self.create_wiki_book(book,wiki_book_present=false)
    WikiBook.create(book_name: @@book_name, library: get_library_name(book), book_id: book.id, book_present: wiki_book_present)
  end


  def self.get_library_name(book)
    book.to_s == 'Book' ? "Osmania" : "Dli"
  end

  def self.check_book_in_wiki(book='')
    full_url = "#{BASE_URL}#{book}"
    parsed_hash = httparty_parse(full_url)
    page_ids = page_ids_in_hash(parsed_hash)
    return  valid_page_id_present?(page_ids)
  end

  def self.valid_page_id_present?(page_ids)
    page_ids.delete("-1") #array will have page_ids including "-1" ie. missing id as well. So we should exclude -1.
   !page_ids.blank? # If array is blank then wiki has no entry, otherwise it has
 end

 def self.page_ids_in_hash(parsed_hash)
    parsed_hash['query']['pages'].keys #gives book page_ids -1 if does not have any
  end

  def self.httparty_parse(url)
   parsed_url = URI.parse(URI.encode(url))
   response = HTTParty.get parsed_url
   return response
 end


end
