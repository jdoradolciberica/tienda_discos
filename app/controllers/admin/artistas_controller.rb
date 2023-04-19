class Admin::ArtistasController < ApplicationController
  before_action :set_artista, only: %i[ show edit update destroy ]
  before_action :requiere_ser_admin

  # GET /admin/artistas or /admin/artistas.json
  def index
    @pagy, @artistas = pagy(Artista.all)
  end

  # GET /admin/artistas/1 or /admin/artistas/1.json
  def show
  end

  # GET /admin/artistas/new
  def new
    @artista = Artista.new
  end

  # GET /admin/artistas/1/edit
  def edit
  end

  # POST /admin/artistas or /admin/artistas.json
  def create
    @artista = Artista.new(artista_params)

    respond_to do |format|
      if @artista.save
        format.html { redirect_to admin_artista_url(@artista), notice: "Artista was successfully created." }
        format.json { render :show, status: :created, location: @artista }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @artista.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/artistas/1 or /admin/artistas/1.json
  def update
    respond_to do |format|
      if @artista.update(artista_params)
        format.html { redirect_to admin_artista_url(@artista), notice: "El artista ha sido creado." }
        format.json { render :show, status: :ok, location: @artista }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @artista.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/artistas/1 or /admin/artistas/1.json
  def destroy
    @artista.discos.each do |disco|
      disco.disco_pedidos.destroy_all
      disco.canciones.destroy_all
      disco.destroy
    end
    @artista.destroy

    respond_to do |format|
      format.html { redirect_to admin_artistas_url, notice: "El artista ha sido borrado." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artista
      @artista = Artista.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def artista_params
      params.require(:artista).permit(:fecha_nacimiento, :nombre, :procedencia, :imagen)
    end
end
