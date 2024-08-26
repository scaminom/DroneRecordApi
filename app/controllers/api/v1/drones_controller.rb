module Api
  module V1
    class DronesController < ApplicationController
      before_action :set_drone, only: [:show, :update, :destroy]
      load_and_authorize_resource

      def index
        drones = Drone.includes(:user).all
        # drones = Drone.all

        response = Panko::ArraySerializer.new(
          drones, each_serializer: DroneSerializer
        ).to_a

        render_success_response(data: { drones: response })
      end

      def show
        render_success_response(data: { drone: DroneSerializer.new.serialize(@drone) })
      end

      def create
        drone = Drone.new(drone_params)

        if drone.save
          render_success_response(data: { drone: }, status: :created)
        else
          render_error_response(drone.errors.full_messages, status:  :unprocessable_entity,
                                                            message: 'drone could not be created')
        end
      end

      def update
        if @drone.update(drone_params)
          render_success_response(data: { drone: @drone }, status: :created)
        else
          render_error_response(@drone.errors.full_messages, status:  :unprocessable_entity,
                                                             message: 'drone could not be updated')
        end
      end

      def destroy
        if @drone.destroy
          render_success_response(message: 'drone deleted successfully')
        else
          render_error_response(@drone.errors.full_messages, status:  404,
                                                             message: 'drone could not be deleted')
        end
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
