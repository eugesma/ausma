class AddDefaultValueWeeks < ActiveRecord::Migration[5.2]
  def change
    change_column_default :teacher_assignatures, :weeks, default: 0 
  end
end
