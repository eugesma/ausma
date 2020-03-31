class CreateConfigs < ActiveRecord::Migration[5.2]
  def change
    create_table :configs do |t|
      t.decimal :assignature_preparation_percentage
      t.decimal :assignature_consultation_percentage

      t.timestamps
    end
    Config.create(assignature_preparation_percentage: 30, assignature_consultation_percentage: 10)
  end
end
