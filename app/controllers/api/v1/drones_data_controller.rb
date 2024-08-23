module Api
  module V1
    class DronesDataController < ApplicationController
      load_and_authorize_resource param_method: :drone_data_params, class: 'DroneData'

      def index
        data = DroneData.all

        render json: data
      end

      def show
        drone_data = DroneData.find(params[:id])
        render json: DroneDataSerializer.new.serialize(drone_data)
      end

      def create
        drone_data = DroneData.new(drone_data_params)

        if drone_data.save
          render json: drone_data, status: :created
        else
          render json: { errors: drone_data.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def drone_data_params
        params.require(:drone_data).permit(*DroneData::WHITELISTED_PARAMS)
      end
    end
  end
end
