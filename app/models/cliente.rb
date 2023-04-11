class Cliente < ApplicationRecord
###
### Associations
###
    has_many :pedidos
###
### Validations
###
    validates :nombre, presence: true
    validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}, uniqueness: true
    validates :password, presence: true
###
### Autenticacion
###
    has_secure_password
end
