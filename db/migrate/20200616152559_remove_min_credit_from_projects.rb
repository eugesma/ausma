class RemoveMinCreditFromProjects < ActiveRecord::Migration[5.2]
  def change
    remove_column :projects, :min_credit, :decimal
  end
end
