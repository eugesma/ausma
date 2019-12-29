class CreateJoinTablePostTeacher < ActiveRecord::Migration[5.2]
  def change
    create_join_table :posts, :teachers, table_name: :teacher_posts do |t|
       t.index [:post_id, :teacher_id]
       t.index [:teacher_id, :post_id]
    end
  end
end
