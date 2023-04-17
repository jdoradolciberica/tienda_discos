class ClientesController < ApplicationController
  #before_action :set_cliente, only: %i[ show edit update destroy ]

  before_action :requiere_sesion, only: %i[perfil]

  # GET /perfil
  def perfil
    render "show"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cliente
      @cliente = Cliente.find(params[:clienteid])
    end

end
