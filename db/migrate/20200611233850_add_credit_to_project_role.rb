class AddCreditToProjectRole < ActiveRecord::Migration[5.2]
  def change
    add_column :project_roles, :credit, :decimal
  end
end
