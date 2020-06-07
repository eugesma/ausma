class AddPresencePercentToTeacherMonthPresence < ActiveRecord::Migration[5.2]
  def change
    add_column :teacher_month_presences, :presence_percent, :integer
  end
end
