class Admin::DiscosController < ApplicationController
  before_action :set_disco, only: %i[ show edit update destroy ]

  # GET /admin/discos or /admin/discos.json
  def index
    @pagy, @discos = pagy(Disco.all)
  end

  # GET /admin/discos/1 or /admin/discos/1.json
  def show
  end

  # GET /admin/discos/new
  def new
    @disco = Disco.new
  end

  # GET /admin/discos/1/edit
  def edit
  end

  # POST /admin/discos or /admin/discos.json
  def create
    @disco = Disco.new(disco_params)

    respond_to do |format|
      if @disco.save
        format.html { redirect_to admin_disco_url(@disco), notice: "Disco was successfully created." }
        format.json { render :show, status: :created, location: @disco }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @disco.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/discos/1 or /admin/discos/1.json
  def update
    respond_to do |format|
      if @disco.update(disco_params)
        format.html { redirect_to admin_disco_url(@disco), notice: "Disco was successfully updated." }
        format.json { render :show, status: :ok, location: @disco }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @disco.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/discos/1 or /admin/discos/1.json
  def destroy
    @disco.destroy

    respond_to do |format|
      format.html { redirect_to admin_discos_url, notice: "Disco was successfully destroyed." }
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
      params.fetch(:disco, {})
    end
end
