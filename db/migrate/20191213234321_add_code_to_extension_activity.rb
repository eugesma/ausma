class AddCodeToExtensionActivity < ActiveRecord::Migration[5.2]
  def change
    add_column :extension_activities, :code, :string
    add_index :extension_activities, :code, unique: true 
  end
end
