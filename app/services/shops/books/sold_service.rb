# frozen_string_literal: true

module Shops
  module Books
    class SoldService
      attr_reader :shop, :book, :copies

      def initialize(shop_id, book_id, copies)
        @shop = Shop.find(shop_id)
        @book = shop.books.find(book_id)
        @copies = copies.to_i
      end

      def call
        return if copies.zero?

        book.books_shops.where(shop_id: shop.id).update_all(
          "in_stock = CASE WHEN in_stock < #{copies} THEN 0 ELSE in_stock - #{copies} END,\
           sold = sold + CASE WHEN in_stock > #{copies} then #{copies} ELSE in_stock END"
        )
      end
    end
  end
end
