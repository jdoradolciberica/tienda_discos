class ClientesController < ApplicationController
  #before_action :set_cliente, only: %i[ show edit update destroy ]

  before_action :requiere_sesion

  # GET /clientes or /clientes.json
  def index
    @pagy, @clientes = pagy(Cliente.all)
  end

  # GET /clientes/1 or /clientes/1.json
  def show
  end

  # GET /clientes/new
  def new
    @cliente = Cliente.new
  end

  # GET /clientes/1/edit
  def edit
  end

  # POST /clientes or /clientes.json
  def create
    cliente_params_freeze = cliente_params
    cliente_params_freeze = prepare_password(cliente_params_freeze)
    p cliente_params_freeze
    @cliente = Cliente.new(cliente_params_freeze)

    respond_to do |format|
      if @cliente.save
        format.html { redirect_to cliente_url(@cliente), notice: "Cliente was successfully created." }
        format.json { render :show, status: :created, location: @cliente }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clientes/1 or /clientes/1.json
  def update
    respond_to do |format|
      if @cliente.update(cliente_params)
        format.html { redirect_to cliente_url(@cliente), notice: "Cliente was successfully updated." }
        format.json { render :show, status: :ok, location: @cliente }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clientes/1 or /clientes/1.json
  def destroy
    @cliente.destroy

    respond_to do |format|
      format.html { redirect_to clientes_url, notice: "Cliente was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cliente
      @cliente = Cliente.find(params[:clienteid])
    end

    # Only allow a list of trusted parameters through.
    def cliente_params
      params.require(:cliente).permit(:email, :password, :nombre)
    end

    def prepare_password(params)
      password = params[:password]
      salt = SecureRandom.hex(4)
      params.delete(:password)
      params[:password_digest] = helpers.digest_password(password, salt)
      params
    end

    def requiere_sesion
      if session[:cliente_id].nil?
        redirect_to sesion_url
      end
    end

end
