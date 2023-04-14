class Cliente < ApplicationRecord
###
### Associations
###
    has_many :pedidos
###
### Validations
###
    validates :nombre, presence: true
    validates :email, format: {with: URI::MailTo::EMAIL_REGEXP, message: "tiene un formato incorrecto"}, uniqueness: { message: "ya está en uso"}
    validates :password, presence: {message: "No se dio una contraseña"}
    validates_confirmation_of :password, allow_blank: true, message: " no coincide con password"
###
### Autenticacion
###
    has_secure_password validations: false
end
