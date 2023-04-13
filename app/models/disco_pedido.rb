class DiscoPedido < ApplicationRecord

###
### Asociaciones
###
  belongs_to :pedido
  belongs_to :disco

###
### Validaciones
###
  validates :pedido, presence: true
  validates :disco, presence: true
  validates :cantidad, numericality: {greater_than_or_equal_to: 1}
end
