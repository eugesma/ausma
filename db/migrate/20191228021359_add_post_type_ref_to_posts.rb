class AddPostTypeRefToPosts < ActiveRecord::Migration[5.2]
  def change
    add_reference :posts, :post_type, foreign_key: true
  end
end
