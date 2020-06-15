class DropTableTeacherPosts < ActiveRecord::Migration[5.2]
  def change
    drop_table :teacher_posts
  end
end
