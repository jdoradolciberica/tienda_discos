class Cliente < ApplicationRecord

    REQUERIMIENTOS_PASSWORD = /\A
        (?=.{8,})
        (?=.*\d)
        (?=.*[a-z])
        (?=.*[A-Z])
        (?=.*[[:^alnum:]])
    /x
###
### Associations
###
    has_many :pedidos
###
### Validations
###
    validates :nombre, format: {with: /[a-zA-Z]+ [a-zA-Z]+/, message: "debe tener al menos dos palabras de más de una letra cada una"}
    validates :email, format: {with: URI::MailTo::EMAIL_REGEXP, message: "tiene un formato incorrecto"}, uniqueness: { message: "ya está en uso"}
    validates :password, format: {with: REQUERIMIENTOS_PASSWORD, message: "no cumple los requerimientos"}
    validates_confirmation_of :password, allow_blank: true, message: " no coincide con la contraseña"
###
### Autenticacion
###
    has_secure_password validations: false

    
end
