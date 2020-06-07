class TeacherProject < ApplicationRecord

  # Relations
  belongs_to :teacher
  belongs_to :project
  belongs_to :project_role

  # Delegations
  delegate :fullname, to: :teacher, prefix: true

  accepts_nested_attributes_for :teacher, :project,
    :reject_if => :all_blank,
    :allow_destroy => true
end
