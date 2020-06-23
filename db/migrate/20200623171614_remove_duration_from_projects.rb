class RemoveDurationFromProjects < ActiveRecord::Migration[5.2]
  def change
    remove_column :projects, :duration, :decimal
  end
end
