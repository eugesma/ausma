class AddMinDurationToDedications < ActiveRecord::Migration[5.2]
  def change
    add_column :dedications, :min_duration, :decimal, precision: 9, scale: 2, default: 0
  end
end
