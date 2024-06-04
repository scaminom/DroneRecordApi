class SolarPanelsController < ApplicationController
  before_action :set_solar_panel, only: %i[show update destroy]

  def index
    solar_panels = SolarPanel.all

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

  private

  def set_solar_panel
    @solar_panel = SolarPanel.find(params[:id])
  end

  def solar_panel_params
    params.require(:solar_panel).permit(:fecha_registro, :vPan, :cPan, :vBat, :cBat, :vCar, :cCar, :user_id)
  end

  def solar_panel_serializer(solar_panel)
    SolarPanelSerializer.new.serialize(solar_panel)
  end
end
