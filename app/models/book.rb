class Book < ActiveRecord::Base
  has_many :book_translations, dependent: :destroy
  has_one :book_description, dependent: :destroy
  has_many :categories, :through => :book_categories
  has_many :book_categories
  belongs_to :language
  belongs_to :author
  belongs_to :publisher
  has_many :wiki_books,  foreign_key: 'book_id', class_name: 'WikiBook'


  def get_full_info
    { book_name: translated_book_name,
      author: translated_author_name,
      publisher: translated_publisher_name,
      library: self.class.to_s == 'Book' ? 'OUDL' : 'DLI',
      year: self.class.to_s == 'Book' ? self.book_description.date_issued : self.book_description.year ,
      url: self.book_description.link,
      categories: self.categories.pluck("kn"),
      is_present_in_wiki: book_in_wiki?
      }.to_hash
    end

    def translated_book_name
      self.book_translations.first.book_title
    end

    def translated_author_name
      self.author.author_translations.first.name
    end

    def translated_publisher_name
      self.publisher.publisher_translations.first.name
    end

    def book_in_wiki?
      WikiBook.check_book_in_wiki(translated_book_name)
    end

    def self.search_books keyword
      ActiveRecord::Base.connection.execute("
        select * from master_books
        where name like '%#{keyword}%'
        or author like '%#{keyword}%'
        ")
    end



    def self.category_books(category)
      ActiveRecord::Base.connection.execute("
        select bt.book_title as name,at.name as author,pt.name as publisher, 'osmania' as library,bd.date_issued as year,  bd.link from book_translations bt
        inner join books b
        on bt.book_id = b.id
        inner join authors a
        on b.author_id = a.id
        left join author_translations at
        on at.author_id = a.id
        inner join book_descriptions bd
        on b.id = bd.book_id
        inner join publishers p
        on p.id = b.publisher_id
        left join publisher_translations pt
        on pt.publisher_id = p.id
        left join book_categories bc
        on b.id = bc.book_id 
        where bc.category_id = #{category}

        UNION ALL
        select dbt.book_title as name,dat.name as author,dpt.name as publisher,'dli' as library,dbd.year as year, dbd.link from dli_book_translations dbt
        inner join dli_books db
        on dbt.book_id = db.id
        inner join dli_authors da
        on db.author_id = da.id
        left join dli_author_translations dat
        on dat.author_id = da.id
        inner join dli_book_descriptions dbd
        on db.id = dbd.book_id
        inner join dli_publishers dp
        on dp.id = db.publisher_id
        left join dli_publisher_translations dpt
        on dpt.publisher_id = dp.id
        left join dli_book_categories dbc
        on db.id = dbc.dli_book_id
        where dbc.category_id = #{category}
        ")
end

def self.create_master 
  # ActiveRecord::Base.connection.execute("
  #   drop VIEW master_books
  #   ")
   # BookTranslation.joins(:book, :book_description).select("book_translations.book_title AS book_title, books.id AS book_id, book_descriptions.link AS link").where("book_translations.book_title like ?", "%#{keyword}%")
   ActiveRecord::Base.connection.execute("
    CREATE VIEW master_books AS
    select bt.book_title as name,at.name as author,pt.name as publisher, 'osmania' as library,bd.date_issued as year,  bd.link from book_translations bt
    inner join books b
    on bt.book_id = b.id
    inner join authors a
    on b.author_id = a.id
    left join author_translations at
    on at.author_id = a.id
    inner join book_descriptions bd
    on b.id = bd.book_id
    inner join publishers p
    on p.id = b.publisher_id
    left join publisher_translations pt
    on pt.publisher_id = p.id

    UNION ALL
    select dbt.book_title as name,dat.name as author,dpt.name as publisher,'dli' as library,dbd.year as year, dbd.link from dli_book_translations dbt
    inner join dli_books db
    on dbt.book_id = db.id
    inner join dli_authors da
    on db.author_id = da.id
    left join dli_author_translations dat
    on dat.author_id = da.id
    inner join dli_book_descriptions dbd
    on db.id = dbd.book_id
    inner join dli_publishers dp
    on dp.id = db.publisher_id
    left join dli_publisher_translations dpt
    on dpt.publisher_id = dp.id
    ")

end

def self.download_book_info

end

def self.to_csv
  @books = Book.includes(:book_translations).includes(:author).includes(:publisher)
  @dli_books = DliBook.includes(:book_translations).includes(:author).includes(:publisher)
  CSV.generate do |csv|
    csv << ['Book', 'Author','Rights' ,'Wiki article', 'Year', 'Publisher']
    @books.each do |book|
      if book.book_translations.first
        csv << [book.book_translations.first.book_title, book.author.author_translations.first.name,book.book_description.rights,book.wiki_book_present?,book.book_description.date_issued,book.publisher.publisher_translations.first.name]
      end
    end
    @dli_books.each do |book|
      if book.book_translations.first
        csv << [book.book_translations.first.book_title, book.author.author_translations.first.name,book.book_description.rights,book.wiki_book_present?,book.book_description.year,book.publisher.publisher_translations.first.name]
      end
    end
  end
end

def wiki_book_present?
  self.wiki_books.where(library: 'Osmania').first.nil? ? false : self.wiki_books.where(library: 'Osmania').first.book_present
end

end


