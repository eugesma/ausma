class ExtensionActivityType < ApplicationRecord
  enum preparation_calc: { porcentaje: 0, fijo: 1 }

  has_many :extension_activities
end
