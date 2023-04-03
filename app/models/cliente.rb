class Cliente < ApplicationRecord
###
### Validations
###
    validates :nombre, presence: true
    validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}
    validates :password_digest, presence: true

end
