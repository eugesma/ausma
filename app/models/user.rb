class User < ApplicationRecord
  devise :database_authenticatable, :authentication_keys => [:username]
  devise :rememberable, :trackable
  has_one :profile, :dependent => :destroy
  has_one :teacher, :dependent => :destroy

  validates :username, presence: true, uniqueness: true

  after_create :create_profile

  def create_profile
    Profile.create(user: self)
    Teacher.create(user: self, profile: self.profile)
  end

  def fullname
    self.profile.fullname
  end
end
