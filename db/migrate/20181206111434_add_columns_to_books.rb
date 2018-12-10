class AddColumnsToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :chapters, :string
  end
end
