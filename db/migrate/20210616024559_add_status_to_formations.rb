class AddStatusToFormations < ActiveRecord::Migration[5.2]
  def change
    add_column :formations, :status, :integer, default: 0
  end
end
