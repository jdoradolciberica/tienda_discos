# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


###
### Borrando datos
###
Cancion.destroy_all
Disco.destroy_all
Artista.destroy_all
Pedido.destroy_all
Cliente.destroy_all

generador_precios = Rubystats::NormalDistribution.new(10, 1)
generador_duracion = Rubystats::NormalDistribution.new(180, 5)
generador_total = Rubystats::NormalDistribution.new(35, 5)

def generar_password_digest()
    password = FFaker::Internet.password
    salt = SecureRandom.hex(4)
    digest = Digest::SHA256.hexdigest(salt + password)
    return salt + digest
end

###
### Creando Artistas
###
100.times do
    artista = Artista.create(
        nombre: FFaker::Music.artist,
        fecha_nacimiento: FFaker::Time.between(Date.new(1940), Date.new(2003)),
        procedencia: FFaker::Address.country
    )
    ###
    ### Creando discos para el artista recien creado
    ### 
    SecureRandom.rand(10).times do
        disco = Disco.create(
            artista: artista,
            nombre: FFaker::Music.album,
            descripcion: FFaker::Lorem.paragraph,
            genero: FFaker::Music.genre,
            precio: generador_precios.rng.round(2).abs
        )

        ###
        ### Creando canciones para ese disco
        ###
        (4..SecureRandom.rand(20)).each do
            Cancion.create(
                disco: disco,
                titulo: FFaker::Music.song,
                duracion: generador_duracion.rng.round.abs
            )
        end
    end
end

###
### Creando clientes
###
200.times do
    cliente = Cliente.create(
        nombre: FFaker::Name.name,
        email: FFaker::Internet.unique.email,
        password_digest: generar_password_digest
    )

    SecureRandom.rand(5).times do
        Pedido.create(
            cliente: cliente,
            codigo: FFaker::BaconIpsum.characters(12).upcase,
            destino: FFaker::AddressIT.full_address,
            total: generador_total.rng.round(2).abs
        )
    end
end



