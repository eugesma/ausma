class MonthPresence < ApplicationRecord
  belongs_to :created_by, class_name: "User"

  has_many :teacher_month_presences, dependent: :destroy
  has_many :teachers, through: :teacher_month_presences

  accepts_nested_attributes_for  :teacher_month_presences,
    :reject_if => :all_blank

  validates_presence_of :month_date

  filterrific(
    default_filter_params: { sorted_by: 'created_at_desc' },
    available_filters: [
      :search_by_name,
      :sorted_by
    ]
  )

  scope :sorted_by, lambda { |sort_option|
    # extract the sort direction from the param value.
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
    when /^created_at_/s
      # Ordenamiento por fecha de creación en la BD
      order("month_presences.created_at #{ direction }")
    else
      # Si no existe la opcion de ordenamiento se levanta la excepcion
      raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
    end
  }
end
