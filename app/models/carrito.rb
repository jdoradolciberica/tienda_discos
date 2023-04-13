class Carrito
    def initialize(carrito_sesion)
        @discos_cantidades = {}
        carrito_sesion.each do |disco_id, cantidad|
            @discos_cantidades[disco_id] = {disco: Disco.find(disco_id), cantidad: cantidad}
        end
    end

    def each
        @discos_cantidades.each do |disco_id, disco_cantidad| 
            yield disco_cantidad[:disco], disco_cantidad[:cantidad]
        end
    end

    def agregar(disco)
        if @discos_cantidades[disco.id].nil?
            @discos_cantidades[disco.id] = {disco: disco, cantidad: 1}
        else
            @discos_cantidades[disco.id][:cantidad] += 1
        end
    end

    def quitar_uno(disco)
        unless @discos_cantidades[disco.id].nil?
            @discos_cantidades[disco.id][:cantidad] -= 1   
            if @discos_cantidades[disco.id][:cantidad] < 1
                @discos_cantidades.delete(disco.id)
            end
        end
    end

    def quitar_todos
        @discos_cantidades = {}
    end

    def to_hash
        carrito_sesion = {}
        @discos_cantidades.each do |disco_id, disco_cantidad|
            carrito_sesion[disco_id] = disco_cantidad[:cantidad]
        end
        return carrito_sesion
    end
end