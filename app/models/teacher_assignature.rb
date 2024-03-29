class TeacherAssignature < ApplicationRecord
  include DateScopes

  belongs_to :teacher
  belongs_to :assignature

  before_validation :calc_total_credit

  accepts_nested_attributes_for :teacher, :assignature,
    :reject_if => :all_blank,
    :allow_destroy => true

  delegate :name, to: :assignature
  delegate :fullname, to: :teacher, prefix: true

  def calc_total_credit
    self.total_credit = self.preparation + self.implementation + self.consultation
  end

  def total_hours
    self.preparation + self.implementation + self.consultation
  end
end
