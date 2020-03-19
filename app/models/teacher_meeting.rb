class TeacherMeeting < ApplicationRecord
  belongs_to :teacher
  belongs_to :meeting
  belongs_to :assistance_status, optional: true

  before_validation :calc_total_credit

  accepts_nested_attributes_for :teacher, :meeting,
    :reject_if => :all_blank,
    :allow_destroy => true

  delegate :name, to: :meeting 
  delegate :fullname, to: :teacher, prefix: :teacher
  
  scope :with_status, lambda { |a_status|
    where('teacher_meetings.assistance_status_id = ?', a_status)
  }

  def calc_total_credit
    if self.assistance_status_id == 1
      self.total_credit = self.meeting.credit
    else
      self.total_credit = 0
    end
  end
end
