module CarritosHelper
    def carrito_total(carrito)
        total = 0
        carrito.each do |disco, cantidad|
            total += cantidad * disco.precio
        end

        return total
    end
end
