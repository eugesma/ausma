class Teacher < ApplicationRecord
  # Relations
  belongs_to :profile, optional: true
  belongs_to :user, optional: true

  has_many :teacher_formations
  has_many :formations, through: :teacher_formations

  has_many :teacher_assignatures
  has_many :assignatures, through: :teacher_assignatures

  has_many :teacher_meetings
  has_many :meetings, through: :teacher_meetings

  has_many :teacher_extension_activities
  has_many :extension_activities, through: :teacher_extension_activities

  has_many :teacher_dedications
  has_many :dedications, through: :teacher_dedications

  has_many :teacher_month_presences
  has_many :month_presences, through: :teacher_month_presences

  has_many :teacher_posts
  has_many :posts, through: :teacher_posts

  has_many :teacher_projects
  has_many :projects, through: :teacher_projects

  delegate :fullname, to: :profile

  def total_credit_assignatures
    self.teacher_assignatures.sum(:total_credit)
  end

  def total_dedication_hours
    self.teacher_dedications.sum(:total_credit)
  end

  def total_post_credits
    self.posts.validado.map { |post| post.post_type.credit }.sum
  end

  def total_formation_credits
    self.teacher_formations.sum(:total_credit)
  end

  def total_extension_activity_credits
    self.teacher_extension_activities.sum(:total_credit)
  end

  def total_project_credits
    self.teacher_projects.sum(:total_credit)
  end
end
