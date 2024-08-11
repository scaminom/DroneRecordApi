class DroneController < ApplicationController
  before_action :set_drone, only: %i[show update destroy]
  load_and_authorize_resource class: drone

  def index
    pagy, drones = pagy(Drone.all) if current_user.admin?

    pagy, drones = pagy(Uav.where(user_id: current_user)) if current_user.user?

    serializerd_drones = drones.map do |drone|
      droneSerializer.new.serialize(drone)
    end

    response = {
      data: serializerd_drones,
      pagination: pagy_metadata(pagy)
    }

    render json: response
  end

  def show
    # render json: droneSerializer.new.serialize(@uav)
    render json: @drone
  end

  def create
    @drone = Drone.new(uav_params)

    if @drone.save
      render json: @drone, status: :created
    else
      render json: @drone.errors, status: :unprocessable_entity
    end
  end

  def update
    if @drone.update(uav_params)
      render json: @drone
    else
      render json: @drone.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @drone.destroy!
  end

  private

  def set_drone
    @drone = Drone.find(params[:id])
  end

  def drone_params
    params.require(:drone).permit(*Dron::WHITELISTED_ATTRIBUTES)
  end
end
