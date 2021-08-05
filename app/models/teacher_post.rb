class TeacherPost < ApplicationRecord
  include DateScopes

  belongs_to :teacher
  belongs_to :post

  accepts_nested_attributes_for :teacher, :post,
    :reject_if => :all_blank,
    :allow_destroy => true

  delegate :name, :post_type_name, :status, :credit, to: :post
end
