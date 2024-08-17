module Api
  module V1
    class DcChargingStationsController < ApplicationController
      before_action :set_dc_charging_station, only: [:show, :update, :destroy]
      load_and_authorize_resource

      def filter_data
        filtering_query = FilteringsSearchQuery.new
        data = filtering_query.perform(DcChargingStation, params)

        render json: data
      end

      def index
        data = DcChargingStation.all

        render json: data
      end

      def show
        render json: @dc_charging_station
      end

      def create
        @dc_charging_station = DcChargingStation.new(dc_charging_station_params)

        if @dc_charging_station.save
          render json: @dc_charging_station, status: :created
        else
          render json: @dc_charging_station.errors, status: :unprocessable_entity
        end
      end

      def update
        if @dc_charging_station.update(dc_charging_station_params)
          render json: @dc_charging_station
        else
          render json: @dc_charging_station.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @dc_charging_station.destroy!
      end

      private

      def set_dc_charging_station
        @dc_charging_station = DcChargingStation.find(params[:id])
      end

      def dc_charging_station_params
        params.require(:dc_charging_station).permit(*DcChargingStation::WHITELISTED_ATTRIBUTES)
      end
    end
  end
end
