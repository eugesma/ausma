class AddWeekDurationToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :week_duration, :integer
  end
end
