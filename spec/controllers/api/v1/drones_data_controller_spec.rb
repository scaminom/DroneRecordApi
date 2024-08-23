require 'rails_helper'

RSpec.describe Api::V1::DronesDataController do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns a successful response' do
      get :index, format: :json
      expect(response).to have_http_status(:ok)
    end

    it 'returns all solar panels' do
      create_list(:drone_data, 3)
      get :index, format: :json
      expect(response.parsed_body.size).to eq(3)
    end
  end

  describe 'GET #show' do
    let(:drone_data) { create(:drone_data) }

    it 'returns a successful response' do
      get :show, params: { id: drone_data.id }
      expect(response).to have_http_status(:ok)
    end

    it 'returns the correct drone' do
      get :show, params: { id: drone_data.id }
      json_response = response.parsed_body
      expect(json_response['id']).to eq(drone_data.id)
    end
  end

  describe 'POST #create' do
    let(:valid_attributes) { attributes_for(:drone_data).merge(drone_id: create(:drone).id) }
    let(:invalid_attributes) { { voltage: '', speed: '' } }

    context 'with valid attributes' do
      it 'creates a new drone_data' do
        expect do
          post :create, params: { drone_data: valid_attributes }
        end.to change(DroneData, :count).by(1)
      end

      it 'returns a successful response' do
        post :create, params: { drone_data: valid_attributes }
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new drone_data' do
        expect do
          post :create, params: { drone_data: invalid_attributes }
        end.not_to change(DroneData, :count)
      end

      it 'returns an unprocessable entity response' do
        post :create, params: { drone_data: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns error messages' do
        post :create, params: { drone_data: invalid_attributes }
        json_response = response.parsed_body
        expect(json_response['errors']).to be_present
      end
    end
  end
end
