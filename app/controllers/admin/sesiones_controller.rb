class Admin::SesionesController < ApplicationController

  before_action :requiere_ser_admin, only: %i[ destroy ]
  before_action :requiere_no_ser_admin, only: %i[ new create ]
  before_action :requiere_no_sesion

  def new
    @admin = Administrador.new
  end

  def create
    @admin = Administrador.find_by(user: admin_params[:user])

    if @admin && @admin.authenticate( admin_params[:password])
      session[:admin] = true
      flash[:notice] = "Ahora eres admin"
      redirect_to admin_url
    else
      flash[:alert] = "User o contraseña incorrecta"
      redirect_to admin_sesiones_new_url
    end
  end

  def destroy
    session[:admin] = nil
    flash[:notice] = "Dejaste de ser admin"
    redirect_to admin_sesiones_new_url
  end

  private
  def admin_params
    params.require(:administrador).permit(:user, :password)
  end
end
