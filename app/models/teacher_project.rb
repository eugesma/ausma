class TeacherProject < ApplicationRecord
  belongs_to :teacher
  belongs_to :project

  before_validation :calc_total_credit

  accepts_nested_attributes_for :teacher, :project,
    :reject_if => :all_blank,
    :allow_destroy => true

  def calc_total_credit
    self.total_credit = self.preparation + self.implementation + self.consultation
  end
end
