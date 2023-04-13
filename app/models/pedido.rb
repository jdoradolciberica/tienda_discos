class Pedido < ApplicationRecord
###
### Associations
###
  belongs_to :cliente
  has_many :disco_pedidos
###
### Validations
###
  validates :codigo, format: {with: /[0-9A-Z]{12}/}
  validates :destino, presence: true

###
### Scopes
###
  def total
    disco_pedidos.reduce(0) { |sum, disco_pedido| sum += disco_pedido.disco.precio }
  end
end
