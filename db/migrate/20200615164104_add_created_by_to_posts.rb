class AddCreatedByToPosts < ActiveRecord::Migration[5.2]
  def change
    add_reference :posts, :created_by, index: true
  end
end
