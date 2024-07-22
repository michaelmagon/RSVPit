class UpdateIsAttendingToString < ActiveRecord::Migration[7.1]
  def change
    change_column :guests, :is_attending, :string, null: false, default: 'undecided'
  end
end
