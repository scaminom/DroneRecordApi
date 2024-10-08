require 'rails_helper'

RSpec.describe Api::V1::DcChargingStationsController do
  let(:user) { create(:user) }
  let(:dc_charging_stations) { create_list(:dc_charging_station, 3) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns a successful response' do
      get :index, format: :json
      expect(response).to have_http_status(:ok)
    end

    it 'returns all solar panels' do
      dc_charging_stations
      get :index, format: :json
      json_response = response.parsed_body
      expect(json_response['data']['dc_charging_stations'].length).to eq(3)
    end
  end

  describe 'GET #filter_data' do
    # rubocop:disable RSpec/ExampleLength
    it 'returns a successful response' do
      dc_charging_stations
      mock_query = instance_double(FilteringsSearchQuery)
      allow(FilteringsSearchQuery).to receive(:new).and_return(mock_query)
      allow(mock_query).to receive(:perform).and_return(DcChargingStation.all)

      get :filter_data, params: { scope: { drone_id: 1 } }
      expect(response).to have_http_status(:ok)
    end

    it 'returns filtered data' do
      dc_charging_stations
      mock_query = instance_double(FilteringsSearchQuery)
      allow(FilteringsSearchQuery).to receive(:new).and_return(mock_query)
      allow(mock_query).to receive(:perform).and_return(DcChargingStation.all)

      get :filter_data, params: { scope: { drone_id: 1 } }
      json_response = response.parsed_body
      expect(json_response['data']['dc_charging_stations'].length).to eq(3)
    end
  end
end
