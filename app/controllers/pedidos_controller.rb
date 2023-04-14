class PedidosController < ApplicationController
  before_action :set_pedido, only: %i[ show edit update destroy ]
  before_action :requiere_sesion_iniciada

  # GET /pedidos or /pedidos.json
  def index
    @pagy, @pedidos = pagy(@cliente.pedidos)
  end

  # GET /pedidos/1 or /pedidos/1.json
  def show
  end

  # GET /pedidos/new
  def new
    @pedido = Pedido.new
    @carrito = Carrito.new session[:carrito]
  end

  # GET /pedidos/1/edit
  def edit
  end

  # POST /pedidos or /pedidos.json
  def create
    @carrito = Carrito.new session[:carrito]
    ActiveRecord::Base.transaction do
      @pedido = Pedido.create!(codigo: genera_codigo, destino: params[:destino], cliente: @cliente)
      @carrito.each do |disco, cantidad|
        DiscoPedido.create(pedido: @pedido, disco: disco, cantidad: cantidad)
      end
    rescue ActiveRecord::RecordInvalid
      flash[:alert] = "El pedido no se pudo completar"
        redirect_to new_pedido_url
    end

    flash[:notice] = "El pedido se completó con éxito"
    redirect_to pedido_url(@pedido)
    
  end

  # PATCH/PUT /pedidos/1 or /pedidos/1.json
  def update
    respond_to do |format|
      if @pedido.update(pedido_params)
        format.html { redirect_to pedido_url(@pedido), notice: "Pedido was successfully updated." }
        format.json { render :show, status: :ok, location: @pedido }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pedidos/1 or /pedidos/1.json
  def destroy
    @pedido.destroy

    respond_to do |format|
      format.html { redirect_to pedidos_url, notice: "Pedido was successfully destroyed." }
      format.json { head :no_content }
    end
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
end
