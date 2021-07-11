class Config < ApplicationRecord

  # Relationships
  has_many :working_day_per_years

  accepts_nested_attributes_for :working_day_per_years, reject_if: :all_blank, allow_destroy: true
end
