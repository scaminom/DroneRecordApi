require 'rails_helper'

RSpec.describe Api::V1::SolarPanelsController do
  let(:user) { create(:user) }
  let(:solar_panels) { create_list(:solar_panel, 3) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns a successful response' do
      get :index, format: :json
      expect(response).to have_http_status(:ok)
    end

    it 'returns all solar panels' do
      solar_panels
      get :index, format: :json
      expect(response.parsed_body.size).to eq(3)
    end
  end

  describe 'GET #filter_data' do
    # rubocop:disable RSpec/ExampleLength
    it 'returns a successful response' do
      solar_panels
      mock_query = instance_double(FilteringsSearchQuery)
      allow(FilteringsSearchQuery).to receive(:new).and_return(mock_query)
      allow(mock_query).to receive(:perform).and_return(SolarPanel.all)

      get :filter_data, params: { scope: { drone_id: 1 } }
      expect(response).to have_http_status(:ok)
    end

    it 'returns filtered data' do
      solar_panels
      mock_query = instance_double(FilteringsSearchQuery)
      allow(FilteringsSearchQuery).to receive(:new).and_return(mock_query)
      allow(mock_query).to receive(:perform).and_return(SolarPanel.all)

      get :filter_data, params: { scope: { drone_id: 1 } }
      expect(response.parsed_body.size).to eq(3)
    end
  end
end
