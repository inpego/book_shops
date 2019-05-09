# frozen_string_literal: true

class ShopSerializer < ActiveModel::Serializer
  attributes :id, :name, :books_sold_count, :books_in_stock

  def books_in_stock
    object.books_shops.includes(:book).map do |book_shop|
      ActiveModelSerializers::SerializableResource.new(book_shop.book, scope: book_shop)
    end
  end
end
