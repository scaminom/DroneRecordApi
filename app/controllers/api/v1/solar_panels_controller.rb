module Api
  module V1
    class SolarPanelsController < ApplicationController
      load_and_authorize_resource

      def filter_data
        filtering_query = FilteringsSearchQuery.new
        data = filtering_query.perform(SolarPanel, params)

        render json: data
      end

      def index
        solar_panels = SolarPanel.all

        render json: Panko::ArraySerializer.new(
          solar_panels, each_serializer: SolarPanelSerializer
        ).to_json
      end

      private

      def solar_panel_params
        params.require(:panel_solar).permit(*SolarPanel::WHITELISTED_PARAMS)
      end
    end
  end
end
