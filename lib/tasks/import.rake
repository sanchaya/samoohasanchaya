require 'csv'

desc "Import all books info from csv"
task :import_books_from_csv => :environment do
  file_name = Rails.root.to_s + '/lib/booksinfo.csv'
  puts 'started importing'
  language_id = Language.where(language_code: 'en').first.id
  CSV.foreach(file_name, :col_sep => ',', :headers => true) do |row|
    p ">>>>>>>>>>>>"
    p row[0]
    p row[1]
    p row[5]
    book = Book.create(author: row[0], publisher: row[5], book_title: row[8], language_id: language_id)
    BookDescription.create(
      :date_accessioned => row[1], 
      :date_available => row[2],
      :date_issued => row[3],
      :link => row[4],
      :rights => row[6],
      :subjects => row[7],
      :file_name => row[9],
      :file_size => row[10],
      :category => row[11],
      :book_id => book.id
      )
  end
end