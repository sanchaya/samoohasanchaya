class BookTranslation < ActiveRecord::Base
  belongs_to :language
  belongs_to :book
  has_one :book_description, through: :book

  validates_presence_of  :book_title
end
