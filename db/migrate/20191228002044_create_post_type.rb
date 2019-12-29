class CreatePostType < ActiveRecord::Migration[5.2]
  def change
    create_table :post_types do |t|
      t.string :name, null: false
      t.integer :credit, null: false
    end
  end
end
