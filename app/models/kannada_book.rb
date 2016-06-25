class KannadaBook < ActiveRecord::Base
  validates_presence_of :name, :author, :publisher

  def self.to_csv
    column_names = KannadaBook.column_names
    CSV.generate do |csv|
      csv << column_names
      all.each do |book|
        csv <<  column_names.map{|column| book.send(column) }
      end
    end
  end
end
