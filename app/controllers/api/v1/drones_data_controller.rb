module Api
  module V1
    class DronesDataController < ApplicationController
      load_and_authorize_resource param_method: :drone_data_params, class: 'DroneData'

      def filter_data
        filtering_query = FilteringsSearchQuery.new
        data = filtering_query.perform(DroneData, params)

        render_success_response(data: { drones_data: data })
      end

      def index
        data = DroneData.all

        response = Panko::ArraySerializer.new(
          data, each_serializer: DroneDataSerializer
        ).to_a

        render_success_response(data: { drones_data: response })
      end

      def show
        drone_data = DroneData.find(params[:id])
        render_success_response(data: { drone_data: DroneDataSerializer.new(except: [:registration_date])
          .serialize(drone_data) })
      end

      def create
        drone_data = DroneData.new(drone_data_params)

        if drone_data.save
          render_success_response(data: { drone_data: }, status: :created)
        else
          render_error_response(drone_data.errors.full_messages, status:  :unprocessable_entity,
                                                                 message: 'drone data could not be created')
        end
      end

      private

      def drone_data_params
        params.require(:drone_data).permit(*DroneData::WHITELISTED_PARAMS)
      end
    end
  end
end
