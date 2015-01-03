class BookTranslation < ActiveRecord::Base
  belongs_to :language
  belongs_to :book

  validates_presence_of  :book_title
end
