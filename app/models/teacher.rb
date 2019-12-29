class Teacher < ApplicationRecord
  belongs_to :profile, optional: true
  belongs_to :user, optional: true
  has_many :teacher_formations
  has_many :formations, through: :teacher_formations

  delegate :fullname, to: :profile
end
