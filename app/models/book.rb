# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :publisher
  has_many :books_shops, dependent: :destroy
  has_many :shops, through: :books_shops
end
