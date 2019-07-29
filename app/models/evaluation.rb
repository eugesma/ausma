class Evaluation < ApplicationRecord
  belongs_to :teacher
  belongs_to :user

  has_many :evaluation_dedications
  has_many :evaluation_extension_activities
  
  has_many :dedications, through: :evaluation_dedications
  has_many :extension_activities, through: :evaluation_extension_activities
end
