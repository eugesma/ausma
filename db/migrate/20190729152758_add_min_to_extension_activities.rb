class AddMinToExtensionActivities < ActiveRecord::Migration[5.2]
  def change
    add_column :extension_activities, :min_preparation, :decimal, precision: 9, scale: 2, default: 0
    add_column :extension_activities, :min_implementation, :decimal, precision: 9, scale: 2, default: 0
    add_column :extension_activities, :min_evaluation, :decimal, precision: 9, scale: 2, default: 0
    add_column :extension_activities, :min_credit, :decimal, precision: 9, scale: 2, default: 0
  end
end
