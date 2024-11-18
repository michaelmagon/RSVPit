class AddEventIdToGuests < ActiveRecord::Migration[7.1]
  def change
    add_column :guests, :event_id, :bigint, null: true
  end
end
