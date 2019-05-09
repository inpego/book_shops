# frozen_string_literal: true

module Shops
  class BooksController < ApplicationController
    def sold
      if Shops::Books::SoldService.new(params[:shop_id], params[:id], params[:copies]).call
        head :ok
      else
        head :unprocessable_entity
      end
    end
  end
end
