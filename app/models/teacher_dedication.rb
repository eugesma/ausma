class TeacherDedication < ApplicationRecord
  include DateScopes

  belongs_to :teacher
  belongs_to :dedication

  after_validation :calc_total_credit

  delegate :fullname, to: :teacher, prefix: true
  delegate :hours, to: :dedication, prefix: true

  def calc_total_credit
    self.total_credit = self.dedication_hours * self.quantity
  end
end
