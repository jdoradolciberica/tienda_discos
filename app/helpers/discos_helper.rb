module DiscosHelper

    def minutos_segundos(segundos)
        "%d:%02d" % [segundos / 60, segundos % 60]
    end
end
