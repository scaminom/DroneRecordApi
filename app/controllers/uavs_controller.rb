class UavsController < ApplicationController
  before_action :set_uav, only: %i[show update destroy]

  def index
    @uavs = Uav.all

    # render json: Panko::ArraySerializer.new(
    #   @uavs, each_serializer: UavSerializer
    # ).to_json
    render json: @uavs
  end

  def show
    # render json: UavSerializer.new.serialize(@uav)
    render json: @uav
  end

  def create
    @uav = Uav.new(uav_params)

    if @uav.save
      render json: @uav, status: :created
    else
      render json: @uav.errors, status: :unprocessable_entity
    end
  end

  def update
    if @uav.update(uav_params)
      render json: @uav
    else
      render json: @uav.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @uav.destroy!
  end

  private

  def set_uav
    @uav = Uav.find(params[:id])
  end

  def uav_params
    params.require(:uav).permit(:tipo_dron, :capacidad_bateria, :tipo_placa, :max_viento_vuelo, :user_id)
  end
end
