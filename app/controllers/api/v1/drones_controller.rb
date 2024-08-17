module Api
  module V1
    class DronesController < ApplicationController
      before_action :set_drone, only: [:show, :update, :destroy]
      load_and_authorize_resource

      def index
        drones = Drone.all

        render json: Panko::ArraySerializer.new(
          drones, each_serializer: DroneSerializer
        ).to_json
      end

      def show
        render json: DroneSerializer.new.serialize(@drone)
      end

      def create
        drone = Drone.new(drone_params)

        if drone.save
          render json: drone, status: :created
        else
          render json: drone.errors, status: :unprocessable_entity
        end
      end

      def update
        if @drone.update(drone_params)
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
        params.require(:drone).permit(*Drone::WHITELISTED_ATTRIBUTES)
      end
    end
  end
end
