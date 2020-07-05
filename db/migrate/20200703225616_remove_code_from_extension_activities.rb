class RemoveCodeFromExtensionActivities < ActiveRecord::Migration[5.2]
  def change
    remove_column :extension_activities, :code, :string
  end
end
