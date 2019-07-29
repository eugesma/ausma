class EvaluationTeacherFormation < ApplicationRecord
  belongs_to :evaluation
  belongs_to :teacher_formation
end
