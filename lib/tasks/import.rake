require 'csv'

desc "Import all books info from csv"
task :import_books_from_csv => :environment do
  file_name = Rails.root.to_s + 'lib/booksinfo.csv'
  puts 'started importing'
  CSV.for_each(file_name, :col_sep => ':', :headers => true) do |row|
    Book.create(author: row[0], publisher: row[5], book_title: row[8])
  end
end