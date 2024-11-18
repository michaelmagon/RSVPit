class AddUserIdToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :user_id, :bigint, null: true
  end
end
