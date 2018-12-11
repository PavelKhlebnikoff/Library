class DropUsers < ActiveRecord::Migration[5.2]
  def change
    drop_table :users do |t|
      t.string.name
      t.timestamps
    end
  end
end
