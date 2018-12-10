class CreateMagazines < ActiveRecord::Migration[5.2]
  def change
    create_table :audio_books do |t|
      t.belongs_to :genre, index: true
      t.string  :name_of_the_magazine
      t.integer :number_of_magazines_by_name
      t.integer :floor
      t.integer :genre_id
      t.boolean :presence_the_magazine
      t.timestamps
    end
  end
end
