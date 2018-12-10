class RemoveColumnFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :name_of_the_book, :string
    remove_column :books, :number_of_books_by_name, :integer
    remove_column :books, :presence_the_book, :boolean

    add_column :books, :name, :string
    add_column :books, :quantity, :integer
    add_column :books, :available, :boolean
  end
end
