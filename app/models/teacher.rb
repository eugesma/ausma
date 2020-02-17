class Teacher < ApplicationRecord
  # Relations
  belongs_to :profile, optional: true
  belongs_to :user, optional: true
  
  has_many :teacher_formations
  has_many :formations, through: :teacher_formations

  has_many :teacher_projects
  has_many :projects, through: :teacher_projects

  delegate :fullname, to: :profile
end
