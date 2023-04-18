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
        unless session[:admin].nil?
          return "admin"
        end
        if session[:cliente_id].nil?
            return "guest"
        else
            return "sesion"
        end
    end

    def requiere_sesion
        if session[:cliente_id].nil?
          redirect_to sesion_url
        end
    end

    def carga_carrito
        if session[:carrito].nil?
          session[:carrito] = {}
        end
        @carrito = Carrito.new session[:carrito]
      end
    
      def guarda_carrito
        session[:carrito] = @carrito.to_hash
      end
    
    def requiere_ser_admin
      if session[:admin].nil?
        redirect_to admin_sesiones_new_url
      end
    end
    
    def requiere_no_ser_admin
      unless session[:admin].nil?
        redirect_to admin_url
      end
    end

end
