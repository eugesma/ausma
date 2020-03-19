class Meeting < ApplicationRecord
  has_many :evaluation_meetings
  has_many :evaluations, through: :evaluation_meetings
  has_many :teacher_meetings, dependent: :destroy
  has_many :teachers, through: :teacher_meetings

  validates_presence_of :name, :credit, :unity

  accepts_nested_attributes_for  :teachers, :teacher_meetings,
    :reject_if => :all_blank,
    :allow_destroy => true

  def count_assist
    self.teacher_meetings.with_status(AssistanceStatus.find(1)).count
  end

  def count_not_assist
    self.teacher_meetings.with_status(AssistanceStatus.find(2)).count
  end

  def count_not_assist_without
    self.teacher_meetings.with_status(AssistanceStatus.find(3)).count
  end
end

