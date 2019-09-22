class User < ApplicationRecord
  rolify
  include PgSearch::Model
  devise :database_authenticatable, :authentication_keys => [:username]
  devise :rememberable, :trackable
  has_one :profile, inverse_of: :user, :dependent => :destroy
  has_one :teacher, :dependent => :destroy

  validates :username, presence: true, uniqueness: true
  validates_presence_of :password

  after_create :create_profile, :assign_default_role

  accepts_nested_attributes_for :profile,  reject_if: :all_blank, allow_destroy: true
  validates_associated :profile, :teacher

  delegate :employee_num, :email, :fullname, :first_name, :last_name, to: :profile

  filterrific(
    default_filter_params: { sorted_by: 'created_at_desc' },
    available_filters: [
      :search_by_username,
      :search_by_fullname,
      :sorted_by
    ]
  )

  pg_search_scope :search_by_username,
    against: :username,
    :using => { :tsearch => {:prefix => true} }, # Buscar coincidencia desde las primeras letras.
    :ignoring => :accents # Ignorar tildes.

  pg_search_scope :search_by_fullname,
    :associated_against => { profile: [:first_name, :last_name] },
    :using => {:tsearch => {:prefix => true} }, # Buscar coincidencia desde las primeras letras.
    :ignoring => :accents # Ignorar tildes.

  scope :sorted_by, lambda { |sort_option|
    # extract the sort direction from the param value.
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
    when /^created_at_/s
      # Ordenamiento por fecha de creación en la BD
      order("users.created_at #{ direction }")
    else
      # Si no existe la opcion de ordenamiento se levanta la excepcion
      raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
    end
  }

  def create_profile
    unless self.profile.present?
      Profile.create(user: self)
      Teacher.create(user: self, profile: self.profile)
    end
  end

  def assign_default_role
    self.add_role(:docente) if self.roles.blank?
  end

  def fullname
    self.profile.fullname
  end
end
