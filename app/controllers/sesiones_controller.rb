class SesionesController < ApplicationController
  before_action :requerir_sesion_iniciada, only: [:destroy]
  before_action :requerir_no_sesion_iniciada, only: [:new, :create]

  def new
    @cliente = Cliente.new
  end

  def create
    
    @cliente = Cliente.find_by(email: sesion_params[:email])
    if @cliente && @cliente.authenticate(sesion_params[:password])
      session[:cliente_id] = @cliente.id
      redirect_to root_url
    else
      flash[:alert] = "Email o contraseña incorrecto"
      redirect_to sesion_url
    end
  end

  def destroy
    session[:cliente_id] = nil
    redirect_to root_url
  end

  private

    def sesion_params
      params.require(:cliente).permit(:email, :password)
    end

    def requerir_no_sesion_iniciada
      unless @cliente.nil?
        redirect_to root_url
      end
    end

    def requerir_sesion_iniciada
      if @cliente.nil?
        redirect_to root_url
      end
    end
end
