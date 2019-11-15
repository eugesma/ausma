class AddDurationToDedications < ActiveRecord::Migration[5.2]
  def change
    add_column :dedications, :duration, :decimal, precision: 9, scale: 2, default: 0
  end
end
