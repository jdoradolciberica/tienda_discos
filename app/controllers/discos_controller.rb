class DiscosController < ApplicationController
  before_action :set_disco, only: %i[ show edit update destroy ]

  # GET /discos or /discos.json
  def index
    @pagy, @discos = pagy(Disco.all)
    
  end

  def buscar
    @pagy, @discos = pagy(Disco.where("lower(nombre) like lower(?)", "%" + Disco.sanitize_sql_like(params[:q]) + "%"))
    render "index"
  end

  # GET /discos/1 or /discos/1.json
  def show
  end

  # GET /discos/new
  def new
    @disco = Disco.new
  end

  # GET /discos/1/edit
  def edit
  end

  # POST /discos or /discos.json
  def create
    @disco = Disco.new(disco_params)

    respond_to do |format|
      if @disco.save
        format.html { redirect_to disco_url(@disco), notice: "Disco was successfully created." }
        format.json { render :show, status: :created, location: @disco }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @disco.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /discos/1 or /discos/1.json
  def update
    respond_to do |format|
      if @disco.update(disco_params)
        format.html { redirect_to disco_url(@disco), notice: "Disco was successfully updated." }
        format.json { render :show, status: :ok, location: @disco }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @disco.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discos/1 or /discos/1.json
  def destroy
    @disco.destroy

    respond_to do |format|
      format.html { redirect_to discos_url, notice: "Disco was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_disco
      @disco = Disco.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def disco_params
      params.require(:disco).permit(:nombre, :artista_id, :descripcion, :genero, :precio)
    end
end
