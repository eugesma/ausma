class AddTeachersCountToAssignature < ActiveRecord::Migration[5.2]
  def change
    add_column :assignatures, :teachers_count, :integer, default: 0
  end
end
