class DliBook < ActiveRecord::Base
  has_many :book_translations, dependent: :destroy, foreign_key: 'book_id', class_name: 'DliBookTranslation'
  has_one :book_description, dependent: :destroy, foreign_key: 'book_id', class_name: 'DliBookDescription'
  has_many :categories, :through => :dli_book_categories
  has_many :dli_book_categories
  belongs_to :language
  belongs_to :author, foreign_key: 'author_id', class_name: 'DliAuthor'
  belongs_to :publisher, foreign_key: 'publisher_id', class_name: 'DliPublisher'
  has_many :wiki_books,  foreign_key: 'book_id', class_name: 'WikiBook'
  has_one :book_review, dependent: :destroy, foreign_key: 'dli_book_id', class_name: 'DliBookReview' #Temporary till gets reviewed then we can remove this

  def get_full_info
    { book_id: self.id,
      book_name: translated_book_name,
      author: translated_author_name,
      publisher: translated_publisher_name,
      library: self.class.to_s == 'Book' ? 'OUDL' : 'DLI',
      year: self.class.to_s == 'Book' ? self.book_description.date_issued : self.book_description.year ,
      url: self.book_description.link,
      categories: self.categories.pluck("kn") ,
      is_present_in_wiki: book_in_wiki?,
      other_metadata: books_other_metadata
      }.to_hash
    end

    def books_other_metadata
      self.book_description.others
    end

    def translated_book_name
      self.book_translations.first.book_title
    end

    def translated_author_name
      self.author.author_translations.first.name
    end

    def translated_publisher_name
      self.publisher.publisher_translations.first.name
    end

    def book_in_wiki?
      WikiBook.check_book_in_wiki(translated_book_name)
    end

    def wiki_book_present?
      self.wiki_books.where(library: 'Dli').first.nil? ? false : self.wiki_books.where(library: 'Dli').first.book_present
    end

    def self.present_wiki_books
      WikiUser.where(is_present: true, library: 'Dli')
    end

    def self.non_copyright_books
      DliBook.joins(:book_description).where("rights = 'OUT_OF_COPYRIGHT'")
    end
end
