class AddTitleToEvent < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :site_title, :string
  end
end
