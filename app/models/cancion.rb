class Cancion < ApplicationRecord
###
### Associations
###
  belongs_to :disco

###
### Validations
###
  validates :titulo, presence: true
  validates :duracion, numericality: {greater_than: 0}
end
