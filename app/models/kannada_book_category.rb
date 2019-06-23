class KannadaBookCategory < ActiveRecord::Base
  belongs_to :kannada_book
  belongs_to :category

end
