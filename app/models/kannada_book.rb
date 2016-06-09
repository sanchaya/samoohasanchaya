class KannadaBook < ActiveRecord::Base
  validates_presence_of :name, :author, :publisher 
end
