class CreateTeacherPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :teacher_posts do |t|
      t.references :teacher, index: true
      t.references :post, index: true

      t.timestamps
    end
  end
end
