class EstacionCargaDcsController < ApplicationController
  before_action :set_estacion_carga_dc, only: %i[show update destroy]

  def index
    datos_estacion_carga_dc = EstacionCargaDc.all
    filter_type = params[:filter_type]&.to_sym
    raise ArgumentError, 'UAV ID is required' unless params[:uav_id]

    filter_params = params.slice(:start_date, :end_date, :date, :start_time, :end_time).merge(uav_id: params[:uav_id])

    if filter_type.present?
      context = FilteringContext.new(datos_estacion_carga_dc, filter_type, filter_params)
      datos_estacion_carga_dc = context.filter
    end

    render json: datos_estacion_carga_dc
  end

  def show
    render json: @estacion_carga_dc
  end

  def create
    @estacion_carga_dc = EstacionCargaDc.new(estacion_carga_dc_params)

    if @estacion_carga_dc.save
      render json: @estacion_carga_dc, status: :created
    else
      render json: @estacion_carga_dc.errors, status: :unprocessable_entity
    end
  end

  def update
    if @estacion_carga_dc.update(estacion_carga_dc_params)
      render json: @estacion_carga_dc
    else
      render json: @estacion_carga_dc.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @estacion_carga_dc.destroy!
  end

  def set_estacion_carga_dc
    @estacion_carga_dc = EstacionCargaDc.find(params[:id])
  end

  def estacion_carga_dc_params
    params.require(:estacion_carga_dc).permit(:fecha_registro, :corriente_dc, :potencia_dc)
  end
end
