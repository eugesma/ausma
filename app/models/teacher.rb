class Teacher < ApplicationRecord
  belongs_to :profile
  belongs_to :user
end
