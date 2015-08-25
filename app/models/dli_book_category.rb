class DliBookCategory < ActiveRecord::Base
  belongs_to :category
  belongs_to :dli_book
end
