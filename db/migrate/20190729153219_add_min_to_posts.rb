class AddMinToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :min_credit, :decimal, precision: 9, scale: 2, default: 0
  end
end
