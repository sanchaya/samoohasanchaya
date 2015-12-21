class DliBook < ActiveRecord::Base
  has_many :book_translations, dependent: :destroy, foreign_key: 'book_id', class_name: 'DliBookTranslation'
  has_one :book_description, dependent: :destroy, foreign_key: 'book_id', class_name: 'DliBookDescription'
  has_many :categories, :through => :dli_book_categories
  has_many :dli_book_categories
  belongs_to :language
  belongs_to :author, foreign_key: 'author_id', class_name: 'DliAuthor'
  belongs_to :publisher, foreign_key: 'publisher_id', class_name: 'DliPublisher'

  def get_full_info
    { book_name: self.book_translations.first.book_title,
      author: self.author.author_translations.first.name,
      publisher: self.publisher.publisher_translations.first.name,
      library: self.class.to_s == 'Book' ? 'OUDL' : 'DLI',
      year: self.class.to_s == 'Book' ? self.book_description.date_issued : self.book_description.year ,
      url: self.book_description.link,
      categories: self.categories.pluck("kn") }.to_hash
  end


  end
