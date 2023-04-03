class Cliente < ApplicationRecord
###
### Associations
###
    has_many :pedidos
###
### Validations
###
    validates :nombre, presence: true
    validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}
    validates :password_digest, presence: true

end
