class CreateWorkingDayPerYears < ActiveRecord::Migration[5.2]
  def change
    create_table :working_day_per_years do |t|
      t.references :config, foreign_key: true, index: true
      t.integer :year
      t.integer :number_of_days

      t.timestamps
    end
  end
end
