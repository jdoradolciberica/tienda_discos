class Artista < ApplicationRecord

###
### Associations
###

###
### Validations
###
    validates :nombre,  presence: true
    validates :fecha_nacimiento, presence: true
    validates :procedencia, presence: true
end
