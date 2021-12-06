class TeacherPost < ApplicationRecord
  # Relationships
  belongs_to :teacher
  belongs_to :post

  # Nested attributes
  accepts_nested_attributes_for :teacher, :post,
                                reject_if: :all_blank,
                                allow_destroy: true

  # Delegations
  delegate :name, :post_type_name, :status, :credit, to: :post, allow_nil: true

  # Scopes
  scope :to_year, lambda { |a_date|
    joins(:post).where(posts: { published_at: a_date.beginning_of_year..a_date.end_of_year })
  }
end
