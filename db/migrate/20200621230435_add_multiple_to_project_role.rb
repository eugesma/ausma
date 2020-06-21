class AddMultipleToProjectRole < ActiveRecord::Migration[5.2]
  def change
    add_column :project_roles, :multiple, :decimal
  end
end
