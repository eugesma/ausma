class AddDurationToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :duration, :decimal
  end
end
