class Assignature < ApplicationRecord
  has_many :evaluation_assignatures
  has_many :evaluations, through: :evaluation_assignatures
  has_many :teacher_assignatures
  has_many :teachers, through: :teacher_assignatures

  validates_presence_of :name, :min_credit, :credit, :min_implementation, :implementation, :consultation, :min_consultation,
    :preparation, :min_preparation
end
