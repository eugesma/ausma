module DefaultScopes
  extend ActiveSupport::Concern

  included do
    pg_search_scope :search_by_teacher,
                    associated_against: { profiles: %i[last_name first_name] },
                    using: { tsearch: { prefix: true } }, # Buscar coincidencia desde las primeras letras.
                    ignoring: :accents # Ignorar tildes.

    pg_search_scope :search_by_name,
                    against: :name,
                    using: { tsearch: { prefix: true } }, # Buscar coincidencia desde las primeras letras.
                    ignoring: :accents # Ignorar tildes.
  end
end
