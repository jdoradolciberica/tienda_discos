class Administrador < ApplicationRecord
    has_secure_password

    validates :user, presence: true
end
