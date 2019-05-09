# frozen_string_literal: true

class Shop < ApplicationRecord
  has_many :books_shops, dependent: :destroy
  has_many :books, through: :books_shops
end
