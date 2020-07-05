class RemoveColumnsFromExtensionActivities < ActiveRecord::Migration[5.2]
  def change
    remove_column :extension_activities, :min_preparation, :decimal
    remove_column :extension_activities, :min_implementation, :decimal
    remove_column :extension_activities, :min_evaluation, :decimal
    remove_column :extension_activities, :min_credit, :decimal
  end
end
