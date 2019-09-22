class Teacher < ApplicationRecord
  belongs_to :profile, optional: true
  belongs_to :user, optional: true

  delegate :fullname, to: :profile
end
