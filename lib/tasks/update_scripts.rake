desc "Update category id for Kannada books"
task update_kannada_book_categories: :environment do

  KannadaBook.all.each do |kannada_book|
    if kannada_book.library == "Osmania"
      categories = BookCategory.where(book_id: kannada_book.book_id)
      categories.each do |category|
        kannada_book.kannada_book_categories.create(kannada_book: kannada_book, category_id: category.category_id)
      end
    elsif kannada_book.library == "Dli"
      categories = DliBookCategory.where(dli_book_id: kannada_book.book_id)
      categories.each do |category|
        kannada_book.kannada_book_categories.create(kannada_book: kannada_book, category_id: category.category_id)
      end
    end
  end

end