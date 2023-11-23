class MedicsController < ApplicationController
  before_action :set_medic, only: %i[ show update destroy ]

  # GET /medics
  def index
    @medics = Medic.all.map {|medic| {id: medic.id, numeroRegistro: medic.registry,"usuario.nome": medic.user.name, "especialidade.id": medic.specialty_id, "especialidade.nome": medic.specialty.name, createdAt: medic.created_at, updatedAt: medic.updated_at}}

    render json: @medics
  end

  # GET /medics/1
  def show
    render json: {id: @medic.id, numeroRegistro: @medic.registry,"usuario.nome": @medic.user.name, "especialidade.id": @medic.specialty_id, "especialidade.nome": @medic.specialty.name, createdAt: @medic.created_at, updatedAt: @medic.updated_at}
  end

  # POST /medics
  def create
    @medic = Medic.new(registry:params[:numeroRegistro], id:params[:"usuario.id"], specialty_id:params[:"especialidade.id"])

    if @medic.save
      render json: {id: @medic.id, numeroRegistro: @medic.registry,"usuario.nome": @medic.id, "especialidade.id": @medic.specialty_id, "especialidade.nome": @medic.specialty.name, createdAt: @medic.created_at, updatedAt: @medic.updated_at}, status: :created, location: @medic
    else
      render json: @medic.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /medics/1
  def update
    puts(@specialty) 
    if @medic.update(registry:params[:numeroRegistro], id:params[:"usuario.id"], specialty_id:params[:"especialidade.id"])
      render json: {id: @medic.id, numeroRegistro: @medic.registry,"usuario.nome": @medic.id, "especialidade.id": @medic.specialty_id, "especialidade.nome": @medic.specialty.name, createdAt: @medic.created_at, updatedAt: @medic.updated_at}
    else
      render json: @medic.errors, status: :unprocessable_entity
    end
  end

  # DELETE /medics/1
  def destroy
    @medic.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medic
      @medic = Medic.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def medic_params

      params.permit(:id, "especialidade.id", :numeroRegistro)
    end
end
