class TeacherFormation < ApplicationRecord

  # Relations
  belongs_to :teacher
  belongs_to :formation
  belongs_to :teacher_formation_role

  # Callbacks
  before_validation :calc_total_credit

  accepts_nested_attributes_for :teacher, :formation,
                                reject_if: :all_blank,
                                allow_destroy: true

  # Delegates
  delegate :hours, :formation_type_name, to: :formation, allow_nil: true
  delegate :plus_percentage, to: :teacher_formation_role
  delegate :name, to: :teacher_formation_role, prefix: true
  delegate :fullname, to: :teacher, prefix: true

  # Validations
  validates_presence_of :teacher, :formation, :teacher_formation_role

  # Scopes
  scope :to_year, lambda { |a_date|
    joins(:formation).where(formations: { init_date: a_date.beginning_of_year..a_date.end_of_year })
  }

  # Calc the total of credits
  def calc_total_credit
    if self.plus_percentage > 0
      # Sum the plus percentaje from the formation type
      self.total_credit = self.hours +  ( self.hours * (self.plus_percentage / 100 + 1))
    else
      self.total_credit = self.hours
    end
  end
end
