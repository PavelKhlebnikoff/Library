class AddColumnNumberOfChaptersToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :number_of_chapters, :integer
  end
end
