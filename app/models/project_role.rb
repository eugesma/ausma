class ProjectRole < ApplicationRecord
  has_many :teacher_projects

  validates_presence_of :name, :multiple
end
