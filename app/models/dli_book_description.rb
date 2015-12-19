class DliBookDescription < ActiveRecord::Base
  serialize :others, Hash
  belongs_to :book, foreign_key: 'book_id',class_name: 'DliBook'
end
