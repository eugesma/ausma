class RenameDedicationsToMeetings < ActiveRecord::Migration[5.2]
  def change
    rename_table :dedications, :meetings
  end
end
