class DronesController < ApplicationController
  # before_action :authenticate_drone!
  before_action :set_drone, only: %i[show destroy]

  def index
    drones = Drone.all

    render json: Panko::ArraySerializer.new(
      drones, each_serializer: DroneSerializer
    ).to_json
  end

  def show
    render json: { drone: drone_serializer(@drone) }
  end

  def create
    @drone = Drone.new(drone_params)

    if @drone.save
      render json: { drone: drone_serializer(@drone) }, status: :accepted
    else
      render json: { errors: @drone.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @drone.update(drone_params)
      render json: { drone: drone_serializer(@drone) }
    else
      render json: { errors: @drone.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @drone.destroy
      render json: { message: 'drone deleted successfully' }
    else
      render json: { errors: @drone.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_drone
    @drone = Drone.find(params[:id])
  end

  def drone_params
    params.require(:drone).permit(*Drone::WHITELISTED_ATTRIBUTES)
  end

  def drone_serializer(drone)
    DroneSerializer.new.serialize(drone)
  end
end
