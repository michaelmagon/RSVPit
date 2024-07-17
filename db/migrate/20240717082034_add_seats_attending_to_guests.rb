class AddSeatsAttendingToGuests < ActiveRecord::Migration[7.1]
  def change
    add_column :guests, :seats_attending, :integer, null: false, default: 0
  end
end
