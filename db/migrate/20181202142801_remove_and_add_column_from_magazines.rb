class RemoveAndAddColumnFromMagazines < ActiveRecord::Migration[5.2]
  def change
    remove_column :audio_books, :name_of_the_magazine, :string
    remove_column :audio_books, :number_of_magazines_by_name, :integer
    remove_column :audio_books, :presence_the_magazine, :boolean

    add_column :audio_books, :name, :string
    add_column :audio_books, :quantity, :integer
    add_column :audio_books, :available, :boolean
  end
end
