class AddAttributesToDedications < ActiveRecord::Migration[5.2]
  def change
    add_column :dedications, :hours_per_week, :integer, default: 0
    add_column :dedications, :hours_per_year, :integer, default: 0
  end
end
