class DatosUavsController < ApplicationController
  before_action :set_datos_uav, only: %i[show update destroy]

  def index
    datos_uav = DatosUav.all
    filter_type = params[:filter_type]&.to_sym
    raise ArgumentError, 'UAV ID is required' unless params[:uav_id]

    filter_params = params.slice(:start_date, :end_date, :date, :start_time, :end_time).merge(uav_id: params[:uav_id])

    if filter_type.present?
      context = FilteringContext.new(datos_uav, filter_type, filter_params)
      pagy, datos_uav = pagy(context.filter)
    end

    response = {
      data: datos_uav,
      pagination: {
        count: pagy.count,
        page: pagy.page,
        items: pagy.items,
        pages: pagy.pages,
        next: pagy.next,
        prev: pagy.prev
      }
    }

    render json: response
  end

  def show
    render json: @datos_uav
  end

  def create
    @datos_uav = DatosUav.new(datos_uav_params)

    if @datos_uav.save
      render json: @datos_uav, status: :created
    else
      render json: @datos_uav.errors, status: :unprocessable_entity
    end
  end

  def update
    if @datos_uav.update(datos_uav_params)
      render json: @datos_uav
    else
      render json: @datos_uav.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @datos_uav.destroy!
  end

  private

  def set_datos_uav
    @datos_uav = DatosUav.find(params[:id])
  end

  def datos_uav_params
    params.require(:datos_uav).permit(:fecha_registro, :voltaje, :porcentaje_bateria, :corriente, :modo_vuelo,
                                      :velocidad, :altitud, :latitud, :longitud, :uav_id)
  end
end
