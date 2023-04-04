class CancionesController < ApplicationController
  before_action :set_cancion, only: %i[ show edit update destroy ]

  # GET /canciones or /canciones.json
  def index
    @pagy, @canciones = pagy(Cancion.all)
  end

  # GET /canciones/1 or /canciones/1.json
  def show
  end

  # GET /canciones/new
  def new
    @cancion = Cancion.new
  end

  # GET /canciones/1/edit
  def edit
  end

  # POST /canciones or /canciones.json
  def create
    @cancion = Cancion.new(cancion_params)

    respond_to do |format|
      if @cancion.save
        format.html { redirect_to cancion_url(@cancion), notice: "Cancion was successfully created." }
        format.json { render :show, status: :created, location: @cancion }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cancion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /canciones/1 or /canciones/1.json
  def update
    respond_to do |format|
      if @cancion.update(cancion_params)
        format.html { redirect_to cancion_url(@cancion), notice: "Cancion was successfully updated." }
        format.json { render :show, status: :ok, location: @cancion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cancion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /canciones/1 or /canciones/1.json
  def destroy
    @cancion.destroy

    respond_to do |format|
      format.html { redirect_to canciones_url, notice: "Cancion was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cancion
      @cancion = Cancion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cancion_params
      params.require(:cancion).permit(:titulo, :disco_id, :duracion)
    end
end
