module ClientesHelper
    def digest_password(password, salt)
        return salt + Digest::SHA256.hexdigest(password + salt)
    end

    def validate_password(password, password_digest)
        return digest_password(password, password_digest[0,8]) == password_digest
    end
end
