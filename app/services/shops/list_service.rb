# frozen_string_literal: true

module Shops
  class ListService
    attr_reader :publisher

    def initialize(publisher_id)
      @publisher = Publisher.find(publisher_id)
    end

    def call
      Shop.select('shops.id, name, SUM(sold) AS books_sold_count')
          .joins(:books).where(books: { publisher_id: publisher.id })
          .group(:id).order(books_sold_count: :desc)
    end
  end
end
