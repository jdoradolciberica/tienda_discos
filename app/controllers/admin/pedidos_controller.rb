class Admin::PedidosController < ApplicationController
  before_action :set_pedido, only: %i[ show edit update destroy ]
  before_action :requiere_ser_admin
  # GET /admin/pedidos or /admin/pedidos.json
  def index
    @pagy, @pedidos = pagy(Pedido.all)
  end

  # GET /admin/pedidos/1 or /admin/pedidos/1.json
  def show
  end

  # GET /admin/pedidos/new
  def new
    @pedido = Pedido.new
  end

  # GET /admin/pedidos/1/edit
  def edit
  end

  # POST /admin/pedidos or /admin/pedidos.json
  def create
    @pedido = Pedido.new(pedido_params)

    respond_to do |format|
      if @pedido.save
        format.html { redirect_to admin_pedido_url(@pedido), notice: "Pedido was successfully created." }
        format.json { render :show, status: :created, location: @pedido }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/pedidos/1 or /admin/pedidos/1.json
  def update
    respond_to do |format|
      if @pedido.update(pedido_params)
        format.html { redirect_to admin_pedido_url(@pedido), notice: "Pedido was successfully updated." }
        format.json { render :show, status: :ok, location: @pedido }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/pedidos/1 or /admin/pedidos/1.json
  def destroy
    @pedido.disco_pedidos.destroy_all
    @pedido.destroy

    respond_to do |format|
      format.html { redirect_to admin_pedidos_url, notice: "Pedido was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pedido
      @pedido = Pedido.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pedido_params
      params.require(:pedido).permit(:cliente_id, :destino, :codigo)
    end
end
