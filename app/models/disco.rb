class Disco < ApplicationRecord

  mount_uploader :portada, PortadaUploader
  
###
### Associations
###  
  belongs_to :artista
  has_many :canciones
  has_many :disco_pedidos

###
### Validations
###
  validates :genero, presence: true
  validates :precio, numericality: { greater_than_or_equal_to: 0.0, less_than: 1000.0}
  validates :nombre, presence: true
end
