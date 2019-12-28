class Formation < ApplicationRecord
  belongs_to :formation_type
  has_many :teacher_formations, dependent: :destroy
  has_many :teachers, through: :teacher_formations

  delegate :name, to: :formation_type, prefix: true
  delegate :plus_percentage, to: :formation_type

  accepts_nested_attributes_for  :teachers, :teacher_formations,
    :reject_if => :all_blank,
    :allow_destroy => true

  validates_presence_of :name, :formation_type, :hours
end
