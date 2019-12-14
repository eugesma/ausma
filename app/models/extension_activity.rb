class ExtensionActivity < ApplicationRecord
  has_many :evaluation_extension_activities
  has_many :evaluations, through: :evaluation_extension_activities
  has_many :teacher_extension_activities
  has_many :teachers, through: :teacher_extension_activities
  belongs_to :career, counter_cache: true

  validates_presence_of :name, :min_credit, :credit, :min_implementation, :implementation, :evaluation, :min_evaluation,
  :preparation, :min_preparation, :career

  delegate :name, to: :career, prefix: :career

  accepts_nested_attributes_for  :teachers, :teacher_extension_activities,
    :reject_if => :all_blank,
    :allow_destroy => true
end
