class AddColumnVotesCountToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :votes_count, :integer, default: 0
  end
end
