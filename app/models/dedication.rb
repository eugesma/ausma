class Dedication < ApplicationRecord
  has_many :evaluation_dedications
  has_many :evaluations, through: :evaluation_dedications
  has_many :teacher_dedications, dependent: :destroy
  has_many :teachers, through: :teacher_dedications

  validates_presence_of :name, :credit, :unity, :duration

  accepts_nested_attributes_for  :teachers, :teacher_dedications,
    :reject_if => :all_blank,
    :allow_destroy => true

  def count_assist
    self.teacher_dedications.with_status(AssistanceStatus.find(1)).count
  end

  def count_not_assist
    self.teacher_dedications.with_status(AssistanceStatus.find(2)).count
  end

  def count_not_assist_without
    self.teacher_dedications.with_status(AssistanceStatus.find(3)).count
  end
end

