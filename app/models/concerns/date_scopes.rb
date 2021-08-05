module DateScopes
  extend ActiveSupport::Concern

  included do
    scope :to_year, ->(a_date) { where(created_at: a_date.beginning_of_year..a_date.end_of_year) }
  end
end
