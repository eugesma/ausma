class RefrechTotalCreditOfTeacherDedications < ActiveRecord::Migration[5.2]
  def change
    TeacherDedication.find_each do |td|
      td.save!
    end
  end
end
