class TeacherFormation < ApplicationRecord
  has_many :evaluation_teacher_formation
  has_many :evaluations, through: :evaluation_teacher_formation
end