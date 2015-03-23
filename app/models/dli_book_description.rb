class DliBookDescription < ActiveRecord::Base
   belongs_to :book, foreign_key: 'book_id',class_name: 'DliBook'
end
