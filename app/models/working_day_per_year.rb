class WorkingDayPerYear < ApplicationRecord
  # Relationships
  belongs_to :config

  # Validations
  validates :year, numericality: { only_integer: true, greater_than: 2018, less_than_or_equal_to: Date.today.year }
  validates :number_of_days, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 365 }
end
