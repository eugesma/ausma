class CreateMonthPresences < ActiveRecord::Migration[5.2]
  def change
    create_table :month_presences do |t|
      t.references :created_by, index: true
      t.datetime :month_date

      t.timestamps
    end
  end
end
