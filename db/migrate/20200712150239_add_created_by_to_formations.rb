class AddCreatedByToFormations < ActiveRecord::Migration[5.2]
  def change
    add_reference :formations, :created_by, index: true
  end
end
