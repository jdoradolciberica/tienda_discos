class Admin::ClientesController < ApplicationController
  before_action :set_cliente, only: %i[ show edit update destroy ]
  before_action :requiere_ser_admin
  # GET /admin/clientes or /admin/clientes.json
  def index
    @pagy, @clientes = pagy(Cliente.all)
  end

  # GET /admin/clientes/1 or /admin/clientes/1.json
  def show
  end

  # GET /admin/clientes/new
  def new
    @cliente = Cliente.new
  end

  # GET /admin/clientes/1/edit
  def edit
  end

  # POST /admin/clientes or /admin/clientes.json
  def create
    @cliente = Cliente.new(cliente_params)

    respond_to do |format|
      if @cliente.save
        format.html { redirect_to admin_cliente_url(@cliente), notice: "Cliente was successfully created." }
        format.json { render :show, status: :created, location: @cliente }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/clientes/1 or /admin/clientes/1.json
  def update
    respond_to do |format|
      if @cliente.update(cliente_params)
        format.html { redirect_to admin_cliente_url(@cliente), notice: "Cliente was successfully updated." }
        format.json { render :show, status: :ok, location: @cliente }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/clientes/1 or /admin/clientes/1.json
  def destroy
    @cliente.pedidos.each do |pedido|
      pedido.disco_pedidos.destroy_all
      pedido.destroy
    end
    @cliente.destroy

    respond_to do |format|
      format.html { redirect_to admin_clientes_url, notice: "Cliente was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cliente
      @cliente = Cliente.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cliente_params
      params.require(:cliente).permit(:password, :email, :nombre)
    end
end
