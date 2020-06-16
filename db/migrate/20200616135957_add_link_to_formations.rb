class AddLinkToFormations < ActiveRecord::Migration[5.2]
  def change
    add_column :formations, :link, :string
  end
end
