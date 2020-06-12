class RemoveCreditFromProjects < ActiveRecord::Migration[5.2]
  def change
    remove_column :projects, :credit, :decimal
  end
end
