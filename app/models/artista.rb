class Artista < ApplicationRecord
    mount_uploader :imagen, ImagenUploader
###
### Associations
###
    has_many :discos
###
### Validations
###
    validates :nombre,  presence: true
    validates :fecha_nacimiento, presence: true
    validates :procedencia, presence: true
end
