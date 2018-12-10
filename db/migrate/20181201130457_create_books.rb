class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string  :name_of_the_book
      t.integer :number_of_books_by_name
      t.integer :floor
      t.integer :genre_id
      t.boolean :presence_the_book
      t.timestamps
    end
  end
end
