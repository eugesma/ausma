class TeacherExtensionActivity < ApplicationRecord
  belongs_to :teacher
  belongs_to :extension_activity

  before_validation :calc_total_credit

  accepts_nested_attributes_for :teacher, :extension_activity,
    :reject_if => :all_blank,
    :allow_destroy => true

  delegate :name, :career_name, :hours, to: :extension_activity

  def calc_total_credit
    self.total_credit = self.preparation + self.implementation + self.evaluation
  end
end
