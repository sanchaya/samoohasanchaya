require 'csv'


desc "Add extra books and traslate"
task :add_extra_books_from_csv => :environment do
  file_name = Rails.root.to_s + '/lib/dli3.csv'
  puts 'started'
  CSV.foreach(file_name, :col_sep => ',', :headers => true) do |row|
    unless CheckBarcode.check_dup(row['BarCode'])
      CreateDli.create_all(row)
    end
  end

end


desc "update year in dli"
task :update_dli_year => :environment do
 file_name = Rails.root.to_s + '/lib/booksinfo.csv'
 exising = []
 non_existing = []
 CSV.foreach(file_name, :col_sep=> ',', :headers => true) do |row|
  dli =  DliBookDescription.find_by(barcode: row['BarCode'])
  if dli 
    p row['Year']
    dli.year = row['Year']
    dli.save
    exising << dli.id
  else
    non_existing << row['BarCode']
  end 
end
p "-------------------EXISTING----------------"
p exising
p "-------------------non_existing----------------"
p non_existing
end

desc "Check missed and duplicate books"
task :check_dup_books_from_csv => :environment do
  file_name = Rails.root.to_s + '/lib/dli2.csv'
  puts 'started'
  @missed = []
  i = 0
  CSV.foreach(file_name, :col_sep => ' ', :headers => true) do |row|
    (0..10).each do |i|
     barcode =  CheckBarcode.compare_row(row[i]) if row[i].to_i.to_s.length > 10
     @missed << barcode.to_i if barcode
   end
 end
 p ">>>>>>>>>>>>>>>>>>>>>.."
 p @missed.inspect
end


desc "Update DLI updated link based on BarCode"
task :update_dli_link_from_csv => :environment do
  puts 'started'
  file_name = Rails.root.to_s + '/lib/new_dli_url.csv' 
  CSV.foreach(file_name, :col_sep => ',', :headers => true) do |row|
    puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    dli = DliBookDescription.find_by_barcode(row['barcode'])
    puts row['barcode']
    puts  row['url']
    dli.update_attribute('link', row['url']) if dli && row['url'] && !row['url'].blank?
  end
end

desc "Update DLI updated archive url based on BarCode"
task :update_dli_archive_link_from_csv => :environment do
  puts 'started'
  file_name = Rails.root.to_s + '/lib/new-dli-mirror.csv' 
  CSV.foreach(file_name, :col_sep => ',', :headers => true) do |row|
    puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    dli = DliBookDescription.find_by_barcode(row['barcode'])
    if dli && row['new_mirror_urls'] && !row['new_mirror_urls'].blank?
      dli.others['old_archive_url'] = dli.others['archive_url'] 
      dli.others['archive_url'] = row['new_mirror_urls']
      dli.save
    end
  end
end



class CreateDli

  def self.create_all(row)
    language_id = Language.find_by(language_code: 'en').id
    author = DliAuthor.create(name: row['Author'], language_id: language_id) unless author = DliAuthor.find_by(name: row['Author'])
    publisher = DliPublisher.create(name: row['Publisher'], language_id: language_id) unless publisher = DliPublisher.find_by(name: row['Publisher'])
    trans_book = DliBook.find_by(book_title: row['Title'])
    book = DliBook.create(author_id: author.id, publisher_id: publisher.id, book_title: row['Title'], language_id: language_id)
    DliBookDescription.create(
      :book_id => book.id, 
      :contributor => row['Contributor'],
      :scanning_center => row['ScanningCenter'],
      :barcode => row['BarCode'],
      :copyright => row['CopyrightOwner'],
      :rights => row['Rights'],
      :year => row['Year'],
      :pages => row['TotalPages'],
      :url => row['ReadOnline'],
      :no_of_pages => row['NumberPages'],
      :vendor => row['Vendor'],
      :subject => row['Subject'],
      :digital_pub_date => row['DigitalPublisherDate'],
      :link => row['Link'],
      :identifier => row['Identifier'],
      :unnumber_pages => row['UnnumberedPages']
      )
    translate_book(book,trans_book.book_translations.first) if trans_book and !trans_book.book_translations.blank?
  end

  def translate_book(book, trans_book)
    book.book_translations.create(book_title: trans_book.book_title, language_id: Language.kannada.id)
  end


end



class CheckBarcode

  def self.check_dup(code)
    DliBookDescription.find_by(barcode: code)
  end

  def self.compare_row(row)
    p "??????????????????????????"
    p row
    return DliBookDescription.find_by(barcode: row).nil? ? row : nil
  end
end

