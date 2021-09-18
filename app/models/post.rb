class Post < ApplicationRecord
  include PgSearch::Model

  enum status: { auditoria: 0, validado: 1, rechazado: 2 }

  # Relationships
  belongs_to :created_by, class_name: 'User'
  belongs_to :post_type
  has_many :teacher_posts
  has_many :teachers, through: :teacher_posts
  has_many :profiles, through: :teachers

  # Delegates
  delegate :name, to: :post_type, prefix: :post_type
  delegate :credit, to: :post_type

  accepts_nested_attributes_for :teachers, :teacher_posts,
                                reject_if: :all_blank,
                                allow_destroy: true

  # Validations
  validates_presence_of :name, :post_type, :link, :published_at, :created_by

  filterrific(
    default_filter_params: { sorted_by: 'fecha_publicada_asc' },
    available_filters: %i[search_by_teacher search_by_name for_statuses sorted_by]
  )

  # Scopes
  pg_search_scope :search_by_teacher,
                  associated_against: { profiles: %i[last_name first_name] },
                  using: { tsearch: { prefix: true } }, # Buscar coincidencia desde las primeras letras.
                  ignoring: :accents # Ignorar tildes.

  pg_search_scope :search_by_name,
                  against: :name,
                  using: { tsearch: { prefix: true } }, # Buscar coincidencia desde las primeras letras.
                  ignoring: :accents # Ignorar tildes.

  scope :sorted_by, lambda { |sort_option|
    direction = sort_option =~ /desc$/ ? 'desc' : 'asc'
    case sort_option.to_s
    when /^fecha_publicada_/s
      # Sort by published_at
      reorder("posts.published_at #{direction}")
    when /^nombre_/s
      # Sort by post name
      reorder("posts.name #{direction}")
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
      ['Fecha (nueva primero)', 'fecha_publicada_desc'],
      ['Fecha (antigua primero)', 'fecha_publicada_asc'],
      ['Nombre (a-z)', 'nombre_asc'],
      ['Nombre (z-a)', 'nombre_desc']
    ]
  end
end
