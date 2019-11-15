class CreateAssistanceStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :assistance_statuses do |t|
      t.string :name

      t.timestamps
    end
  end
end
