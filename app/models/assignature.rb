class Assignature < ApplicationRecord
  has_many :evaluation_assignatures
  has_many :evaluations, through: :evaluation_assignatures
  has_many :teacher_assignatures
  has_many :teachers, through: :teacher_assignatures
  belongs_to :career, counter_cache: true

  validates_presence_of :name, :min_credit, :credit, :min_implementation, :implementation, :consultation, :min_consultation,
    :preparation, :min_preparation, :career

  delegate :name, to: :career, prefix: :career 
end
