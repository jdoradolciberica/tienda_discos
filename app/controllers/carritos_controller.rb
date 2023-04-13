class CarritosController < ApplicationController
  before_action :requiere_sesion
  before_action :carga_carrito
  after_action :guarda_carrito

  def show
  end

  def agregar
  end

  def quitar
  end

  def menos
  end

  def mas
  end

  def vaciar
  end

  private

  def requiere_sesion
    if session[:cliente_id].nil?
      redirect_to sesion_url
    end
  end

  def carga_carrito
    if session[:carrito].nil?
      session[:carrito] = {1860 => 2, 1845 => 1, 1856 => 3}
    end

    session[:carrito] = {1860 => 2, 1845 => 1, 1856 => 3}
    @carrito = Carrito.new session[:carrito]
  end

  def guarda_carrito
    session[:carrito] = @carrito.to_hash
  end
end

