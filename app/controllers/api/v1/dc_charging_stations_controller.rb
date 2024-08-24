module Api
  module V1
    class DcChargingStationsController < ApplicationController
      load_and_authorize_resource

      def filter_data
        filtering_query = FilteringsSearchQuery.new
        data = filtering_query.perform(DcChargingStation, params)

        render_success_response(data: { dc_charging_stations: data })
      end

      def index
        dc_charging_stations = DcChargingStation.all

        response = Panko::ArraySerializer.new(
          dc_charging_stations, each_serializer: DcChargeStationSerializer
        ).to_a

        render_success_response(data: { dc_charging_stations: response })
      end

      private

      def dc_charging_station_params
        params.require(:dc_charging_station).permit(*DcChargingStation::WHITELISTED_ATTRIBUTES)
      end
    end
  end
end
