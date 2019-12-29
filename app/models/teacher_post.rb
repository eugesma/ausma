class TeacherPost < ApplicationRecord
    belongs_to :post
    belongs_to :teacher
end