class TeacherDedication < ApplicationRecord
  belongs_to :teacher
  belongs_to :dedication
  belongs_to :assistance_status, optional: true

  before_validation :calc_total_credit

  accepts_nested_attributes_for :teacher, :dedication,
    :reject_if => :all_blank,
    :allow_destroy => true

  delegate :name, to: :dedication 
  delegate :fullname, to: :teacher, prefix: :teacher
  
  scope :with_status, lambda { |a_status|
    where('teacher_dedications.assistance_status_id = ?', a_status)
  }

  def calc_total_credit
    if self.assistance_status_id == 1
      self.total_credit = self.quantity * self.dedication.credit
    else
      self.total_credit = 0
    end
  end
end
