class ArtistasController < ApplicationController
  before_action :set_artista, only: %i[ show edit update destroy ]

  # GET /artistas or /artistas.json
  def index
    @artistas = Artista.all
  end

  # GET /artistas/1 or /artistas/1.json
  def show
  end

  # GET /artistas/new
  def new
    @artista = Artista.new
  end

  # GET /artistas/1/edit
  def edit
  end

  # POST /artistas or /artistas.json
  def create
    @artista = Artista.new(artista_params)

    respond_to do |format|
      if @artista.save
        format.html { redirect_to artista_url(@artista), notice: "Artista was successfully created." }
        format.json { render :show, status: :created, location: @artista }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @artista.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /artistas/1 or /artistas/1.json
  def update
    respond_to do |format|
      if @artista.update(artista_params)
        format.html { redirect_to artista_url(@artista), notice: "Artista was successfully updated." }
        format.json { render :show, status: :ok, location: @artista }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @artista.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artistas/1 or /artistas/1.json
  def destroy
    @artista.destroy

    respond_to do |format|
      format.html { redirect_to artistas_url, notice: "Artista was successfully destroyed." }
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
      params.require(:artista).permit(:nombre, :fecha_nacimiento, :procedencia)
    end
end
