class Assignature < ApplicationRecord
  include PgSearch::Model
  include DefaultScopes

  # Relationships
  has_many :evaluation_assignatures
  has_many :evaluations, through: :evaluation_assignatures
  has_many :teacher_assignatures
  has_many :teachers, through: :teacher_assignatures
  has_many :profiles, through: :teachers
  belongs_to :career, counter_cache: true

  # Validations
  validates_presence_of :name, :min_credit, :credit, :min_implementation, :implementation, :consultation, :min_consultation,
                        :preparation, :min_preparation, :career

  # Delegations
  delegate :name, to: :career, prefix: :career

  # Nested attributes
  accepts_nested_attributes_for :teachers, :teacher_assignatures,
                                reject_if: :all_blank,
                                allow_destroy: true

  filterrific(
    default_filter_params: { sorted_by: 'nombre_asc' },
    available_filters: %i[search_by_teacher search_by_name sorted_by]
  )

  # Scopes
  scope :sorted_by, lambda { |sort_option|
    # extract the sort direction from the param value.
    direction = sort_option =~ /desc$/ ? 'desc' : 'asc'
    case sort_option.to_s
    when /^nombre_/s
      # Ordenamiento por nombre
      reorder("assignatures.name #{direction}")
    else
      # Si no existe la opcion de ordenamiento se levanta la excepcion
      raise(ArgumentError, "Invalid sort option: #{sort_option.inspect}")
    end
  }

  def self.options_for_sorted_by
    [
      ['Nombre (a-z)', 'nombre_asc'],
      ['Nombre (z-a)', 'nombre_desc']
    ]
  end
end
