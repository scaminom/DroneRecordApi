class StationsController < ApplicationController
  # before_action :authenticate_station!
  before_action :set_station, only: %i[show destroy]

  def index
    stations = Station.all

    render json: Panko::ArraySerializer.new(
      stations, each_serializer: StationSerializer
    ).to_json
  end

  def show
    render json: { station: station_serializer(@station) }
  end

  def create
    @station = Station.new(station_params)

    if @station.save
      render json: { station: station_serializer(@station) }, status: :accepted
    else
      render json: { errors: @station.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @station.update(station_params)
      render json: { station: station_serializer(@station) }
    else
      render json: { errors: @station.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @station.destroy
      render json: { message: 'station deleted successfully' }
    else
      render json: { errors: @station.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_station
    @station = Station.find(params[:id])
  end

  def station_params
    params.require(:station).permit(*Station::WHITELISTED_ATTRIBUTES)
  end

  def station_serializer(station)
    StationSerializer.new.serialize(station)
  end
end
