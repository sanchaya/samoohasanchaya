class DliBookReview < ActiveRecord::Base
  #Temporary till gets reviewed then we can remove this
  belongs_to :book, foreign_key: 'dli_book_id',class_name: 'DliBook'
end
