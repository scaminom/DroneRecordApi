module Api
  module V1
    class AcChargingStationsController < ApplicationController
      load_and_authorize_resource

      def filter_data
        filtering_query = FilteringsSearchQuery.new
        data = filtering_query.perform(AcChargingStation, params)

        render_success_response(data: { ac_charging_stations: data })
      end

      def index
        ac_charging_stations = AcChargingStation.all

        response = Panko::ArraySerializer.new(
          ac_charging_stations, each_serializer: AcChargeStationSerializer
        ).to_a

        render_success_response(data: { ac_charging_stations: response })
      end

      private

      def ac_charging_station_params
        params.require(:ac_charging_station).permit(*AcChargingStation::WHITELISTED_ATTRIBUTES)
      end
    end
  end
end
