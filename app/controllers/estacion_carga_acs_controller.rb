class EstacionCargaAcsController < ApplicationController
  before_action :set_estacion_carga_ac, only: %i[show update destroy]

  def index
    datos_estacion_carga_ac = EstacionCargaAc.all
    filter_type = params[:filter_type]&.to_sym
    raise ArgumentError, 'UAV ID is required' unless params[:uav_id]

    filter_params = params.slice(:start_date, :end_date, :date, :start_time, :end_time).merge(uav_id: params[:uav_id])

    if filter_type.present?
      context = FilteringContext.new(datos_estacion_carga_ac, filter_type, filter_params)
      pagy, datos_estacion_carga_ac = pagy(context.filter)
    end

    response = {
      data: datos_estacion_carga_ac,
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
    render json: @estacion_carga_ac
  end

  def create
    @estacion_carga_ac = EstacionCargaAc.new(estacion_carga_ac_params)

    if @estacion_carga_ac.save
      render json: @estacion_carga_ac, status: :created
    else
      render json: @estacion_carga_ac.errors, status: :unprocessable_entity
    end
  end

  def update
    if @estacion_carga_ac.update(estacion_carga_ac_params)
      render json: @estacion_carga_ac
    else
      render json: @estacion_carga_ac.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @estacion_carga_ac.destroy!
  end

  private

  def set_estacion_carga_ac
    @estacion_carga_ac = EstacionCargaAc.find(params[:id])
  end

  def estacion_carga_ac_params
    params.require(:estacion_carga_ac).permit(:fecha_registro, :corriente_ac, :potencia_ac)
  end
end
