class ApplicationController < ActionController::Base
    include Pagy::Backend
    
    before_action :seleccionar_cliente
    layout :seleccionar_layout

    private

    def seleccionar_cliente
        if !session[:cliente_id].nil?
            
            @cliente = Cliente.find(session[:cliente_id])
        end
    end

    def seleccionar_layout
        if session[:cliente_id].nil?
            return "guest"
        else
            return "sesion"
        end
    end

end
