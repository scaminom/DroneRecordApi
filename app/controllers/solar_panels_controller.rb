class SolarPanelsController < ApplicationController
  before_action :set_solar_panel, only: %i[show update destroy]

  def index
    solar_panels = SolarPanel.all
    filter_type = params[:filter_type]&.to_sym
    filter_params = params.slice(:start_date, :end_date)

    if filter_type.present?
      context = FilteringContext.new(solar_panels, filter_type, filter_params)
      solar_panels = context.filter
    end

    render json: Panko::ArraySerializer.new(
      solar_panels, each_serializer: SolarPanelSerializer
    ).to_json
  end

  def show
    render json: { solar_panel: solar_panel_serializer(@solar_panel) }
  end

  def create
    @solar_panel = SolarPanel.new(solar_panel_params)

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

  def show_solar_panel_info
    date, start_time, end_time = info_params.values_at(:date, :start_time, :end_time)

    solar_panel_info_service = SolarPanelInfoService.new(date, start_time, end_time)
    solar_panels = solar_panel_info_service.call

    render json: Panko::ArraySerializer.new(
      solar_panels, each_serializer: SolarPanelSerializer
    ).to_json
  end

  private

  def set_solar_panel
    @solar_panel = SolarPanel.find(params[:id])
  end

  def info_params
    params.permit(:date, :start_time, :end_time)
  end

  def solar_panel_params
    params.require(:solar_panel).permit(:fecha_registro, :vPan, :cPan, :vBat, :cBat, :vCar, :cCar, :user_id)
  end

  def solar_panel_serializer(solar_panel)
    SolarPanelSerializer.new.serialize(solar_panel)
  end
end
