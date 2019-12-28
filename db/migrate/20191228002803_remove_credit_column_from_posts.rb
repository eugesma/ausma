class RemoveCreditColumnFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :credit, :decimal
    remove_column :posts, :min_credit, :decimal
  end
end

