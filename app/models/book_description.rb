class BookDescription < ActiveRecord::Base
  serialize :others, Hash
  belongs_to :book
end
