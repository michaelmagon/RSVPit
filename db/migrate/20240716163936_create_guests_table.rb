class CreateGuestsTable < ActiveRecord::Migration[7.1]
  def change
    create_table :guests_tables do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :slug, null: false
      t.string :email, null: false
      t.string :phone_number, null: false
      t.string :facbook_link
      t.text :notes
      t.integer :number_of_seats, null: false
      t.boolean :is_attending, null: false

      t.timestamps
    end
  end
end
