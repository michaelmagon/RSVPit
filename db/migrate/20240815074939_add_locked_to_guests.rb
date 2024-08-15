class AddLockedToGuests < ActiveRecord::Migration[7.1]
  def change
    add_column :guests, :locked, :boolean, default: false
  end
end
