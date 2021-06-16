class Post < ApplicationRecord
  include PgSearch::Model

  enum status: { auditoria: 0, validado: 1, rechazado: 2 }
  
  # Relationships
  belongs_to :created_by, class_name: "User"
  belongs_to :post_type
  has_many :teacher_posts
  has_many :teachers, through: :teacher_posts
  
  # Delegates
  delegate :name, to: :post_type, prefix: :post_type
  delegate :credit, to: :post_type
  
  accepts_nested_attributes_for  :teachers, :teacher_posts,
    :reject_if => :all_blank,
    :allow_destroy => true
  
  # Validations
  validates_presence_of :name, :post_type, :link, :published_at, :created_by

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
          # Ordenamiento por fecha de creación en la BD
          order("posts.name #{ direction }")
      else
          # Si no existe la opcion de ordenamiento se levanta la excepcion
          raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
      end
  }
end