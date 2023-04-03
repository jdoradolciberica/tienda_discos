class Pedido < ApplicationRecord
###
### Associations
###
  belongs_to :cliente

###
### Validations
###
  validates :codigo, format: {with: /[0-9A-Z]{12}/}
  validates :total, numericality: {greater_than: 0.0}
  validates :destino, presence: true
end
