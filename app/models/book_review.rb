class BookReview < ActiveRecord::Base
  #Temporary till gets reviewed then we can remove this model
  belongs_to :book
end
