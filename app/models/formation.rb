class Formation < ApplicationRecord
  include PgSearch::Model

  enum certificate: { no: 0, digital: 1, papel: 2 }
  enum status: { auditoria: 0, validado: 1, rechazado: 2 }

  # Relations
  belongs_to :formation_type
  belongs_to :created_by, class_name: 'User', optional: true
  belongs_to :validated_by, class_name: 'User', optional: true
  has_many :teacher_formations, dependent: :destroy
  has_many :teachers, through: :teacher_formations
  has_many :profiles, through: :teachers

  # Delegations
  delegate :name, to: :formation_type, prefix: :formation_type
  delegate :plus_percentage, to: :formation_type

  accepts_nested_attributes_for :teachers, :teacher_formations,
                                reject_if: :all_blank,
                                allow_destroy: true

  # Validations
  validates_presence_of :name, :formation_type, :hours, :init_date
  validates_associated :teacher_formations

  filterrific(
    default_filter_params: { sorted_by: 'name_at_desc' },
    available_filters: %i[search_by_teacher search_by_name sorted_by]
  )

  # Scopes
  pg_search_scope :search_by_teacher,
                  associated_against: { profiles: %i[last_name first_name] },
                  using: { tsearch: { prefix: true } }, # Buscar coincidencia desde las primeras letras.
                  ignoring: :accents # Ignorar tildes.

  pg_search_scope :search_by_name,
                  against: :name,
                  using: { tsearch: {prefix: true } }, # Buscar coincidencia desde las primeras letras.
                  ignoring: :accents # Ignorar tildes.

  scope :sorted_by, lambda { |sort_option|
    # extract the sort direction from the param value.
    direction = sort_option =~ /desc$/ ? 'desc' : 'asc'
    case sort_option.to_s
    when /^name_/s
      # Ordenamiento por nombre
      order("formations.name #{direction}")
    else
      # Si no existe la opcion de ordenamiento se levanta la excepcion
      raise(ArgumentError, "Invalid sort option: #{sort_option.inspect}")
    end
  }
end
