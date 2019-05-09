require 'rails_helper'

describe PublishersController, type: :request do
  describe 'GET #show' do
    let(:publisher) { create(:publisher) }
    let(:books) { create_list(:book, 6, publisher: publisher) }
    let(:shops) { create_list(:shop, 3) }
    let!(:books_shop) do
      [7, 3, 9, 5, 4, 2].map.with_index do |i, j|
        create(:books_shop, in_stock: i / 2, sold: i, book: books[j], shop: shops[j / 2])
      end
    end
    subject { JSON.parse(response.body) }

    it "returns list of shops with given publisher's books" do
      get "/publishers/#{publisher.id}"
      is_expected.to eq([
        shops[1].attributes.slice('id', 'name').merge(
          'books_sold_count' => 14,
          'books_in_stock' => [
            books[2].attributes.slice('id', 'title').merge('copies_in_stock' => 4),
            books[3].attributes.slice('id', 'title').merge('copies_in_stock' => 2),
          ]),
        shops[0].attributes.slice('id', 'name').merge(
          'books_sold_count' => 10,
          'books_in_stock' => [
            books[0].attributes.slice('id', 'title').merge('copies_in_stock' => 3),
            books[1].attributes.slice('id', 'title').merge('copies_in_stock' => 1),
          ]),
        shops[2].attributes.slice('id', 'name').merge(
          'books_sold_count' => 6,
          'books_in_stock' => [
            books[4].attributes.slice('id', 'title').merge('copies_in_stock' => 2),
            books[5].attributes.slice('id', 'title').merge('copies_in_stock' => 1),
          ])
      ])
    end
  end
end
