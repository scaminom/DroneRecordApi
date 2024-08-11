module DroneData
  class DroneDataController < ApplicationController
    before_action :set_drone_data, only: %i[show update destroy]
    load_and_authorize_resource class: DroneData

    def index
      data = DroneData.all

      render json: data
    end

    def show
      render json: @drone_data
    end

    def create
      @drone_data = DroneData.new(datos_uav_params)

      if @drone_data.save
        render json: @drone_data, status: :created
      else
        render json: @drone_data.errors, status: :unprocessable_entity
      end
    end

    def update
      if @drone_data.update(datos_uav_params)
        render json: @drone_data
      else
        render json: @drone_data.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @drone_data.destroy!
    end

    private

    def set_drone_data
      @drone_data = DroneData.find(params[:id])
    end

    def drone_data_params
      params.require(:drone_data).permit(*DroneData::WHITELISTED_PARAMS)
    end
  end
end
