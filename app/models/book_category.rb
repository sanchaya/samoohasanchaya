class BookCategory < ActiveRecord::Base
  belongs_to :category
  belongs_to :book
end
