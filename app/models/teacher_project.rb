class TeacherProject < ApplicationRecord

  # Relations
  belongs_to :teacher
  belongs_to :project
  belongs_to :project_role

  # Delegations
  delegate :fullname, to: :teacher, prefix: true
  delegate :name, to: :project_role, prefix: true

  validates :week_hours, presence: true, numericality: { greater_than: 0, message: "Las horas semanales deben ser mayores a cero." } 

  before_save :calc_total_credit

  accepts_nested_attributes_for :teacher, :project,
    :reject_if => :all_blank,
    :allow_destroy => true

  def calc_total_credit
    self.total_credit = self.week_hours * self.project_role.multiple
  end
end
