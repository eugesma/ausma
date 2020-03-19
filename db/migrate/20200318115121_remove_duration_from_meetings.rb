class RemoveDurationFromMeetings < ActiveRecord::Migration[5.2]
  def change
    remove_column :meetings, :duration, :decimal, precision: 9, scale: 2, default: 0
  end
end
