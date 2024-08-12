module Api
  module V1
    class SolarPanelsController < ApplicationController
      before_action :set_solar_panel, only: %i[show update destroy]
      load_and_authorize_resource

      def filter_data
        filtering_query = FilteringsSearchQuery.new
        data = filtering_query.perform(SolarPanel, params)

        render json: data
      end

      def index
        data = SolarPanel.all

        render json: data
      end

      def show
        render json: { solar_panel: solar_panel_serializer(@solar_panel) }
      end

      def create
        @solar_panel = PanelSolar.new(solar_panel_params)

        if @solar_panel.save
          render json: { solar_panel: solar_panel_serializer(@solar_panel) }, status: :accepted
        else
          render json: { errors: @solar_panel.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @solar_panel.update(solar_panel_params)
          render json: { solar_panel: station_serializer(@solar_panel) }
        else
          render json: { errors: @solar_panel.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        if @solar_panel.destroy
          render json: { message: 'solar panel deleted successfully' }
        else
          render json: { errors: @solar_panel.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def set_solar_panel
        @solar_panel = SolarPanel.find(params[:id])
      end

      def info_params
        params.permit(:date, :start_time, :end_time)
      end

      def solar_panel_params
        params.require(:panel_solar).permit(*SolarPanel::WHITELISTED_PARAMS)
      end

      def solar_panel_serializer(solar_panel)
        SolarPanelSerializer.new.serialize(solar_panel)
      end
    end
  end
end
