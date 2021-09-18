class Formation < ApplicationRecord
  include PgSearch::Model
  include DefaultScopes

  enum certificate: { no: 0, digital: 1, papel: 2 }
  enum status: { auditoria: 0, validado: 1, rechazado: 2 }

  # Relationships
  belongs_to :formation_type
  belongs_to :created_by, class_name: 'User', optional: true
  belongs_to :validated_by, class_name: 'User', optional: true
  has_many :teacher_formations, dependent: :destroy
  has_many :teachers, through: :teacher_formations
  has_many :profiles, through: :teachers

  # Delegations
  delegate :name, to: :formation_type, prefix: :formation_type
  delegate :plus_percentage, to: :formation_type

  # Nested attributes
  accepts_nested_attributes_for :teachers, :teacher_formations,
                                reject_if: :all_blank,
                                allow_destroy: true

  # Validations
  validates_presence_of :name, :formation_type, :hours, :init_date
  validates_associated :teacher_formations

  filterrific(
    default_filter_params: { sorted_by: 'fecha_inicio_desc' },
    available_filters: %i[search_by_teacher search_by_name for_statuses sorted_by]
  )

  # Scopes
  scope :sorted_by, lambda { |sort_option|
    direction = sort_option =~ /desc$/ ? 'desc' : 'asc'
    case sort_option.to_s
    when /^fecha_inicio_/s
      # Sort by init_date
      reorder("formations.init_date #{direction}")
    when /^nombre_/s
      # Sort by name
      reorder("formations.name #{direction}")
    else
      raise(ArgumentError, "Invalid sort option: #{sort_option.inspect}")
    end
  }

  scope :for_statuses, lambda { |values|
    return all if values.blank?

    where(status: statuses.values_at(*Array(values)))
  }

  def self.options_for_status
    [
      ['Auditoria', 'auditoria', 'warning'],
      ['Validado', 'validado', 'success'],
      ['Rechazado', 'rechazado', 'danger']
    ]
  end

  def self.options_for_sorted_by
    [
      ['Fecha (nueva primero)', 'fecha_inicio_desc'],
      ['Fecha (antigua primero)', 'fecha_inicio_asc'],
      ['Nombre (a-z)', 'nombre_asc'],
      ['Nombre (z-a)', 'nombre_desc']
    ]
  end
end
