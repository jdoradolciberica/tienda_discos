json.extract! disco, :id, :nombre, :artista_id, :descripcion, :genero, :precio, :created_at, :updated_at
json.url disco_url(disco, format: :json)
