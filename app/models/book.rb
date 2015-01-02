class Book < ActiveRecord::Base
  has_many :book_translations, dependent: :destroy
  has_one :book_description, dependent: :destroy
  belongs_to :language
  belongs_to :author
  belongs_to :publisher
end
