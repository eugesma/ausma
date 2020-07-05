class ExtensionActivity < ApplicationRecord
  include PgSearch::Model
  
  # Relations
  has_many :evaluation_extension_activities
  has_many :evaluations, through: :evaluation_extension_activities
  has_many :teacher_extension_activities, dependent: :destroy
  has_many :teachers, through: :teacher_extension_activities
  belongs_to :extension_activity_type

  # Validations
  validates_presence_of :name, :credit, :implementation, :evaluation, :preparation, :extension_activity_type

  # Delegations
  delegate :name, to: :extension_activity_type, prefix: true

  accepts_nested_attributes_for  :teachers, :teacher_extension_activities,
    :reject_if => :all_blank,
    :allow_destroy => true

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
          order("extension_activities.name #{ direction }")
      else
          # Si no existe la opcion de ordenamiento se levanta la excepcion
          raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
      end
  }
end
