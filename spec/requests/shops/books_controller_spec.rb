require 'rails_helper'

describe Shops::BooksController, type: :request do
  describe 'PUT #sold' do
    context 'when shop does not exist' do
      it 'returns 404 Not Found' do
        expect { put '/shops/2/books/3/sold/4' }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    let(:book) { create(:book) }
    let(:shop) { create(:shop) }
    let!(:book_shop) { create(:books_shop, book: book, shop: shop, in_stock: 2, sold: 4) }

    context 'when copies are more than stock copies' do
      it 'sets stock count to 0 and add actual stock count to sold count' do
        expect { put "/shops/#{shop.id}/books/#{book.id}/sold/5" }.to change { book_shop.reload.in_stock }.to(0).and(
                                                                      change { book_shop.reload.sold }.to(6))

      end
    end

    context 'when copies are equal or less than stock copies' do
      it 'substract copies count from stock count and add copies count to sold count' do
        expect { put "/shops/#{shop.id}/books/#{book.id}/sold/1" }.to change { book_shop.reload.in_stock }.to(1).and(
                                                                      change { book_shop.reload.sold }.to(5))

      end
    end
  end
end
