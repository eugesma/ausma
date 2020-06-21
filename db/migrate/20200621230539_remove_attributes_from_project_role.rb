class RemoveAttributesFromProjectRole < ActiveRecord::Migration[5.2]
  def change
    remove_column :project_roles, :credit, :decimal
    remove_column :project_roles, :percent, :integer
  end
end
