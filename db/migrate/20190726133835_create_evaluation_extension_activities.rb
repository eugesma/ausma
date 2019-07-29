class CreateEvaluationExtensionActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluation_extension_activities do |t|
      t.references :evaluation, foreign_key: true
      t.references :extension_activity, foreign_key: true
      t.decimal :preparation, precision: 9, scale: 2, default: 0
      t.decimal :implementation, precision: 9, scale: 2, default: 0
      t.decimal :evaluation, precision: 9, scale: 2, default: 0
      t.decimal :total_credit, precision: 9, scale: 2, default: 0
      t.decimal :quantity, precision: 9, scale: 2, default: 0

      t.timestamps
    end
  end
end
