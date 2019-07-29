class AddMinToAssignatures < ActiveRecord::Migration[5.2]
  def change
    add_column :assignatures, :min_preparation, :decimal, precision: 9, scale: 2, default: 0
    add_column :assignatures, :min_implementation, :decimal, precision: 9, scale: 2, default: 0
    add_column :assignatures, :min_consultation, :decimal, precision: 9, scale: 2, default: 0
    add_column :assignatures, :min_credit, :decimal, precision: 9, scale: 2, default: 0
  end
end
