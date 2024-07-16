class RenameTableToGuests < ActiveRecord::Migration[7.1]
  def change
    rename_table :guests_tables, :guests
  end
end
