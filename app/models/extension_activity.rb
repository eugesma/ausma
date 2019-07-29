class ExtensionActivity < ApplicationRecord
  has_many :evaluation_extension_activities
  has_many :evaluations, through: :evaluation_extension_activities
end
