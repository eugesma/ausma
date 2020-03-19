class AddDatesToMeetings < ActiveRecord::Migration[5.2]
  def change
    add_column :meetings, :since_date, :datetime
  end
end
