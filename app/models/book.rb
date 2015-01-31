class Book < ActiveRecord::Base
  has_many :book_translations, dependent: :destroy
  has_one :book_description, dependent: :destroy
  belongs_to :language
  belongs_to :author
  belongs_to :publisher

  def self.search_books keyword
     BookTranslation.joins(:book, :book_description).select("book_translations.book_title AS book_title, books.id AS book_id, book_descriptions.link AS link").where("book_translations.book_title like ?", "%#{keyword}%")
  end
end
