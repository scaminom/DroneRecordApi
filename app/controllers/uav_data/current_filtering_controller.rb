module UavData
  class CurrentFilteringController < ApplicationController
    def index
      datos_uav = DatosUav.all
      context = FilteringContext.new(datos_uav, :current, filtering_params)
      pagy, datos_uav = pagy(context.filter, items: 5)

      response = {
        data: datos_uav,
        pagination: pagy_metadata(pagy)
      }

      render json: response
    end
  end
end
