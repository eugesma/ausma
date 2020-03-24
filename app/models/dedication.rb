class Dedication < ApplicationRecord
  has_many :teacher_dedications
  has_many :teachers, through: :teacher_dedications

  accepts_nested_attributes_for  :teachers, :teacher_dedications,
    :reject_if => :all_blank,
    :allow_destroy => true
end
