class CreateChapters < ActiveRecord::Migration[5.2]
  def change
    create_table :chapters do |t|
      t.string :name
      t.text   :text
      t.timestamps
    end
  end
end
