class RemoveCareerFromExtensionActivities < ActiveRecord::Migration[5.2]
  def change
    remove_reference :extension_activities, :career, index: true
  end
end
