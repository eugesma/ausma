class TeacherDedication < ApplicationRecord
  belongs_to :teacher
  belongs_to :dedication

  delegate :fullname, to: :teacher, prefix: true
end
