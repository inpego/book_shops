# frozen_string_literal: true

class BooksShop < ApplicationRecord
  belongs_to :book
  belongs_to :shop
end
