module AcChargingStation
  class AcChargingStationsController < ApplicationController
    before_action :set_ac_charging_station, only: %i[show update destroy]
    load_and_authorize_resource class: AcChargingStation

    def index
      data = AcChargingStation.all

      render json: data
    end

    def show
      render json: @ac_charging_station
    end

    def create
      @ac_charging_station = AcChargingStation.new(ac_charging_station_params)

      if @ac_charging_station.save
        render json: @ac_charging_station, status: :created
      else
        render json: @ac_charging_station.errors, status: :unprocessable_entity
      end
    end

    def update
      if @ac_charging_station.update(ac_charging_station_params)
        render json: @ac_charging_station
      else
        render json: @ac_charging_station.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @ac_charging_station.destroy!
    end

    private

    def set_ac_charging_station
      @ac_charging_station = AcChargingStation.find(params[:id])
    end

    def ac_charging_station_params
      params.require(:ac_charging_station).permit(*AcChargingStation::WHITELISTED_ATTRIBUTES)
    end
  end
end
