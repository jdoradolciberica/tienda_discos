json.extract! artista, :id, :nombre, :fecha_nacimiento, :procedencia, :created_at, :updated_at
json.url artista_url(artista, format: :json)
