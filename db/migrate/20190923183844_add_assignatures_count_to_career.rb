class AddAssignaturesCountToCareer < ActiveRecord::Migration[5.2]
  def change
    add_column :careers, :assignatures_count, :integer, default: 0
  end
end
