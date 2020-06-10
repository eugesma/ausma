class AddProjectTypeToProjects < ActiveRecord::Migration[5.2]
  def change
    add_reference :projects, :project_type, index: true, default: 1
  end
end
