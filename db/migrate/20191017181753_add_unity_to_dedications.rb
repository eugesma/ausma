class AddUnityToDedications < ActiveRecord::Migration[5.2]
  def change
    add_column :dedications, :unity, :string
  end
end
