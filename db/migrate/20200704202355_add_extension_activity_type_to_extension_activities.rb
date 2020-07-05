class AddExtensionActivityTypeToExtensionActivities < ActiveRecord::Migration[5.2]
  def change
    add_reference :extension_activities, :extension_activity_type, index: true
  end
end
