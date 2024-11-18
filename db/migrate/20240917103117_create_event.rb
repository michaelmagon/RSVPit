class CreateEvent < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.datetime :happening_on, null: false

      t.timestamps
    end
  end
end
