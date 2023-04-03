json.extract! cliente, :id, :email, :password_digest, :nombre, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
