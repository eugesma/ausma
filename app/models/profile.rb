class Profile < ApplicationRecord
  belongs_to :user
  has_one :teacher

  accepts_nested_attributes_for :teacher,
    :reject_if => :all_blank,
    :allow_destroy => true

  def fullname
    if self.last_name.present? && self.first_name.present?
      self.last_name+" "+self.first_name
    else
      self.user.username
    end
  end
end
