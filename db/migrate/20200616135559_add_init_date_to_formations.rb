class AddInitDateToFormations < ActiveRecord::Migration[5.2]
  def change
    add_column :formations, :init_date, :datetime
  end
end
