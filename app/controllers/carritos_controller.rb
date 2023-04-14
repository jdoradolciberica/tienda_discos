class CarritosController < ApplicationController
  before_action :requiere_sesion
  before_action :carga_carrito
  after_action :guarda_carrito

  def show
  end

  def agregar
    @carrito.agregar(Disco.find(params[:disco_id]))
    redirect_back fallback_location: carrito_url
  end

  def quitar
    @carrito.quitar_disco(Disco.find(params[:disco_id]))
    redirect_to carrito_url
  end

  def menos
    @carrito.quitar_uno(Disco.find(params[:disco_id]))
    redirect_to carrito_url
  end

  def mas
    puts "Called"
    @carrito.agregar(Disco.find(params[:disco_id]))
    redirect_to carrito_url
  end

  def vaciar
    @carrito.quitar_todos
    redirect_to carrito_url
  end

  private

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
end

