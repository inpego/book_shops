class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.references :publisher, index: true, foreign_key: true, null: false
      t.string :title, null: false
      t.timestamps
    end
  end
end
