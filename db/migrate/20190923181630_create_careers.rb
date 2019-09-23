class CreateCareers < ActiveRecord::Migration[5.2]
  def change
    create_table :careers do |t|
      t.string :name
      t.integer :year_duration

      t.timestamps
    end
  end
end
