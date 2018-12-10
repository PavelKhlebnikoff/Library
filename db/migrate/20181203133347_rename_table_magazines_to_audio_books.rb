class RenameTableMagazinesToAudioBooks < ActiveRecord::Migration[5.2]
  def change
    rename_table :audio_books, :audio_books
  end
end
