class Admin::DiscoPedidosController < ApplicationController
  before_action :set_disco_pedido, only: %i[ show edit update destroy ]

  # GET /admin/disco_pedidos or /admin/disco_pedidos.json
  def index
    @pagy, @disco_pedidos = pagy(DiscoPedido.all)
  end

  # GET /admin/disco_pedidos/1 or /admin/disco_pedidos/1.json
  def show
  end

  # GET /admin/disco_pedidos/new
  def new
    @disco_pedido = DiscoPedido.new
  end

  # GET /admin/disco_pedidos/1/edit
  def edit
  end

  # POST /admin/disco_pedidos or /admin/disco_pedidos.json
  def create
    @disco_pedido = DiscoPedido.new(disco_pedido_params)

    respond_to do |format|
      if @disco_pedido.save
        format.html { redirect_to admin_disco_pedido_url(@disco_pedido), notice: "Disco pedido ha sido creado" }
        format.json { render :show, status: :created, location: @disco_pedido }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @disco_pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/disco_pedidos/1 or /admin/disco_pedidos/1.json
  def update
    respond_to do |format|
      if @disco_pedido.update(disco_pedido_params)
        format.html { redirect_to admin_disco_pedido_url(@disco_pedido), notice: "Disco pedido ha sido actualizado" }
        format.json { render :show, status: :ok, location: @disco_pedido }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @disco_pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/disco_pedidos/1 or /admin/disco_pedidos/1.json
  def destroy
    @disco_pedido.destroy

    respond_to do |format|
      format.html { redirect_to admin_disco_pedidos_url, notice: "Disco pedido ha sido destruido." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_disco_pedido
      @disco_pedido = DiscoPedido.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def disco_pedido_params
      params.require(:disco_pedido).permit(:disco_id, :pedido_id, :cantidad)
    end
end
