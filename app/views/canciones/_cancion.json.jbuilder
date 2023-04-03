json.extract! cancion, :id, :titulo, :disco_id, :duracion, :created_at, :updated_at
json.url cancion_url(cancion, format: :json)
