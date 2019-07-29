class Dedication < ApplicationRecord
  has_many :evaluation_dedications
  has_many :evaluations, through: :evaluation_dedications
end
