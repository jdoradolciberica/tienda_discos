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

###
### Creando Artistas
###
100.times do
    artista = Artista.create(
        nombre: FFaker::Music.artist,
        fecha_nacimiento: FFaker::Time.between(Date.new(1940), Date.new(2002)),
        procedencia: FFaker::Address.country
    )
    ###
    ### Creando discos para el artista recien creado
    ### 
    SecureRandom.rand(1..10).times do
        disco = Disco.create(
            artista: artista,
            nombre: FFaker::Music.album,
            descripcion: FFaker::Lorem.paragraph,
            genero: FFaker::Music.genre,
            precio: generador_precios.rng.round(2).abs,
            fecha_lanzamiento: FFaker::Time.between(artista.fecha_nacimiento + 18.years, Date.new(2023))
        )

        ###
        ### Creando canciones para ese disco
        ###
        SecureRandom.rand(5..15).times do
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
    password = FFaker::Internet.password
    cliente = Cliente.create(
        nombre: FFaker::Name.name,
        email: FFaker::Internet.unique.email,
        password: password,
        password_confirmation: password
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



