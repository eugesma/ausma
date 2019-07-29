class AddMinToParticipations < ActiveRecord::Migration[5.2]
  def change
    add_column :participations, :min_preparation, :decimal, precision: 9, scale: 2, default: 0
    add_column :participations, :min_meeting, :decimal, precision: 9, scale: 2, default: 0
    add_column :participations, :min_credit, :decimal, precision: 9, scale: 2, default: 0
  end
end
