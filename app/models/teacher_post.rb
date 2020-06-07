class TeacherPost < ApplicationRecord
  # Relations
  belongs_to :post
  belongs_to :teacher
end