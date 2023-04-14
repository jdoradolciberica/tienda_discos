class RegistrosController < ApplicationController

  before_action :requiere_no_sesion

  def new
    @cliente = Cliente.new
  end

  def create
    @cliente = Cliente.new(registro_params)
    if @cliente.save
      session[:cliente_id] = @cliente.id
      flash[:notice] = "Ahora eres cliente"
      redirect_to root_url
    else
      flash[:alert] = @cliente.errors.full_messages[0]
      redirect_to registro_url
    end
  end

  private
    def registro_params
      params.require(:cliente).permit(:nombre, :email, :password, :password_confirmation)
    end

    def requiere_no_sesion
      unless @cliente.nil?
        redirect_to root_url
      end
    end
end
