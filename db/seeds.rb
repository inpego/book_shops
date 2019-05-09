shops = %w[Amazon Waterstones Wordery].map { |name| Shop.create(name: name) }

{
  Penguin: ['Nanaville', 'Cribsheet', 'Neon Prey'],
  Scholastic: ['The Wonky Donkey', "Fall of the Beasts: The Dragon’s Eye", 'Dog Man'],
  HarperCollins: ['The Woman in the Window', 'Girl, Wash Your Face', 'Magnolia Table']
}.each do |publisher_name, book_titles|
  publisher = Publisher.create(name: publisher_name)
  book_titles.map do |title|
    book = publisher.books.create(title: title)
    shops.sample(rand(1..3)).each do |shop|
      BooksShop.create(book_id: book.id, shop_id: shop.id, in_stock: rand(10), sold: rand(10))
    end
  end
end
