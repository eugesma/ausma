class AddValidatedByToFormations < ActiveRecord::Migration[5.2]
  def change
    add_reference :formations, :validated_by, index: true
  end
end
