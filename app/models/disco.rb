class Disco < ApplicationRecord
  
###
### Associations
###  
  belongs_to :artista

###
### Validations
###
  validates :genero, presence: true
  validates :precio, numericality: { greater_than_or_equal_to: 0.0, less_than: 1000.0}
  validates :nombre, presence: true
end
