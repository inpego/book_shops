class CreateBooksShops < ActiveRecord::Migration[5.2]
  def change
    create_table :books_shops do |t|
      t.references :book, index: false, foreign_key: true, null: false
      t.references :shop, index: true, foreign_key: true, null: false
      t.integer :in_stock, null: false, default: 0
      t.integer :sold, null: false, default: 0
      t.index %i[book_id shop_id], unique: true
    end
  end
end
