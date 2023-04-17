class PedidosController < ApplicationController
  before_action :set_pedido, only: %i[ show edit update destroy ]
  before_action :requiere_sesion
  before_action :carga_carrito, only: %i[ new create ]
  before_action :carrito_no_vacio, only: %i[ new create ]
  after_action :guarda_carrito, only: %i[ create ]

  # GET /pedidos or /pedidos.json
  def index
    @pagy, @pedidos = pagy(@cliente.pedidos)
  end

  # GET /pedidos/1 or /pedidos/1.json
  def show
  end

  # GET /pedidos/new
  def new
    if @carrito.empty?
      redirect_to root_url
    end
    @pedido = Pedido.new
  end

  # POST /pedidos or /pedidos.json
  def create
    ActiveRecord::Base.transaction do
      @pedido = Pedido.create!(codigo: genera_codigo, destino: params[:destino], cliente: @cliente)
      @carrito.each do |disco, cantidad|
        DiscoPedido.create(pedido: @pedido, disco: disco, cantidad: cantidad)
      end
    rescue ActiveRecord::RecordInvalid
      flash[:alert] = "El pedido no se pudo completar"
        redirect_to new_pedido_url
    end
    @carrito.quitar_todos
    flash[:notice] = "El pedido se completó con éxito"
    redirect_to pedido_url(@pedido)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pedido
      @pedido = @cliente.pedidos.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pedido_params
      params.require(:pedido).permit(:destino)
    end

    def requiere_sesion_iniciada
      if @cliente.nil?
        redirect_to sesion_url
      end
    end

    def genera_codigo
      SecureRandom.alphanumeric(12).upcase
    end

    def nuevo_codigo
      while true
        codigo = genera_codigo
        if Pedido.find_by(codigo: codigo)
          return codigo
        end
      end
    end

    def carrito_no_vacio
      if @carrito.empty?
        redirect_to root_url
      end
    end
end
