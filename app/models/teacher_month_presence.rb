class TeacherMonthPresence < ApplicationRecord
  # Relations
  belongs_to :teacher
  belongs_to :month_presence

  # Delegations
  delegate :fullname, to: :teacher, prefix: true

  # Validations
  validates_presence_of :presence_time, :presence_percent
end
