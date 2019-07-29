class Assignature < ApplicationRecord
  has_many :evaluation_assignatures
  has_many :evaluations, through: :evaluation_assignatures
end
