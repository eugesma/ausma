class AddCareerToExtensionActivity < ActiveRecord::Migration[5.2]
  def change
    add_reference :extension_activities, :career, foreign_key: true
  end
end
