class TeacherMonthPresence < ApplicationRecord
  belongs_to :teacher
  belongs_to :month_presence
end
