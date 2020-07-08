class Project < ApplicationRecord
  include PgSearch::Model
    
  # Relations
  has_many :teacher_projects, dependent: :destroy
  has_many :teachers, through: :teacher_projects
  belongs_to :project_type

  accepts_nested_attributes_for  :teachers, :teacher_projects,
    :reject_if => :all_blank,
    :allow_destroy => true

  # Validations
  validates_presence_of :name, :code, :week_duration

  # Delegations
  delegate :name, to: :project_type, prefix: true

  filterrific(
    default_filter_params: { sorted_by: 'created_at_desc' },
    available_filters: [
        :search_by_name,
        :sorted_by
    ]
  )

  # Scopes
  pg_search_scope :search_by_name,
    against: :name,
    :using => { :tsearch => {:prefix => true} }, # Buscar coincidencia desde las primeras letras.
    :ignoring => :accents # Ignorar tildes.

  scope :sorted_by, lambda { |sort_option|
      # extract the sort direction from the param value.
      direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
      case sort_option.to_s
      when /^name_/s
          # Ordenamiento por nombre
          order("projects.name #{ direction }")
      else
          # Si no existe la opcion de ordenamiento se levanta la excepcion
          raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
      end
  }
end
