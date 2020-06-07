class AddObservationToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :observation, :text
  end
end
