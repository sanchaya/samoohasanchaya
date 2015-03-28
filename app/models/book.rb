class Book < ActiveRecord::Base
  has_many :book_translations, dependent: :destroy
  has_one :book_description, dependent: :destroy
  belongs_to :language
  belongs_to :author
  belongs_to :publisher

  def self.search_books keyword
   # BookTranslation.joins(:book, :book_description).select("book_translations.book_title AS book_title, books.id AS book_id, book_descriptions.link AS link").where("book_translations.book_title like ?", "%#{keyword}%")
   ActiveRecord::Base.connection.execute("
    select bt.book_title as name,at.name as author,pt.name as publisher, 'osmania' as library,  bd.link from book_translations bt
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
    where bt.book_title like '%#{keyword}%'
    or at.name like '%#{keyword}%'

    UNION ALL
    select dbt.book_title as name,dat.name as author,dpt.name as publisher,'dli' as library, dbd.link from dli_book_translations dbt
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
    where dbt.book_title like '%#{keyword}%'

    order by name
    ")

end
end


