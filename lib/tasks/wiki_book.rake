desc "Update whether wikipedia has these list of books or not"
task :update_wiki_book => :environment do
  puts "Clearing wiki books"
  WikiBook.delete_all
  puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
  WikiBook.wiki_books
  puts "Ended"
end
