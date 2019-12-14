class AddExtensionActivitiesCountToCareer < ActiveRecord::Migration[5.2]
  def change
    add_column :careers, :extension_activities_count, :integer, default: 0
  end
end
