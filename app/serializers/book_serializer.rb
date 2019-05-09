# frozen_string_literal: true

class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :copies_in_stock

  def copies_in_stock
    scope.in_stock
  end
end
