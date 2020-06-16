class AddCertificateToFormations < ActiveRecord::Migration[5.2]
  def change
    add_column :formations, :certificate, :integer, default: 0
  end
end
