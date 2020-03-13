class Teacher < ApplicationRecord
  # Relations
  belongs_to :profile, optional: true
  belongs_to :user, optional: true

  has_many :teacher_formations
  has_many :formations, through: :teacher_formations

  has_many :teacher_assignatures
  has_many :assignatures, through: :teacher_assignatures

  has_many :teacher_dedications
  has_many :dedications, through: :teacher_dedications

  has_many :teacher_extension_activities
  has_many :extension_activities, through: :teacher_extension_activities

  delegate :fullname, to: :profile
  delegate :total_dedication, to: :teacher_assignatures

  def total_credit_assignatures
    self.teacher_assignatures.sum(:total_credit)
  end
end
