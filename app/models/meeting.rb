class Meeting < ApplicationRecord
  include PgSearch::Model
  include DefaultScopes

  # Relationships
  has_many :teacher_meetings, dependent: :destroy
  has_many :teachers, through: :teacher_meetings
  has_many :profiles, through: :teachers

  # Validations
  validates_presence_of :name, :credit, :unity

  # Nested attributes
  accepts_nested_attributes_for :teachers, :teacher_meetings,
                                reject_if: :all_blank,
                                allow_destroy: true

  filterrific(
    default_filter_params: { sorted_by: 'fecha_desc' },
    available_filters: %i[search_by_teacher search_by_name search_by_name sorted_by]
  )

  # Scopes
  scope :sorted_by, lambda { |sort_option|
    direction = sort_option =~ /desc$/ ? 'desc' : 'asc'
    case sort_option.to_s
    when /^fecha_/s
      # Sort by since_date
      reorder("meetings.since_date #{direction}")
    when /^nombre_/s
      # Sort by name
      reorder("meetings.name #{direction}")
    else
      raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
    end
  }

  def self.options_for_sorted_by
    [
      ['Fecha (nueva primero)', 'fecha_desc'],
      ['Fecha (antigua primero)', 'fecha_asc'],
      ['Nombre (a-z)', 'nombre_asc'],
      ['Nombre (z-a)', 'nombre_desc']
    ]
  end

  def count_assist
    self.teacher_meetings.with_status(AssistanceStatus.find(1)).count
  end

  def count_not_assist
    self.teacher_meetings.with_status(AssistanceStatus.find(2)).count
  end

  def count_not_assist_without
    self.teacher_meetings.with_status(AssistanceStatus.find(3)).count
  end
end
