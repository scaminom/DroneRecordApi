require 'rails_helper'

RSpec.describe Api::V1::DronesController do
  let(:admin) { create(:user, role: 'admin') }
  let(:user) { create(:user) }

  before do
    sign_in current_user
  end

  describe 'GET #index' do
    let(:current_user) { user }

    it 'returns a successful response' do
      get :index, format: :json
      expect(response).to have_http_status(:ok)
    end

    it 'returns all drones' do
      create_list(:drone, 3)
      get :index, format: :json
      expect(response.parsed_body.size).to eq(3)
    end
  end

  describe 'GET #show' do
    let(:drone) { create(:drone) }
    let(:current_user) { user }

    it 'returns a successful response' do
      get :show, params: { id: drone.id }
      expect(response).to have_http_status(:ok)
    end

    it 'returns the correct drone' do
      get :show, params: { id: drone.id }
      json_response = response.parsed_body
      expect(json_response['id']).to eq(drone.id)
    end
  end

  describe 'POST #create' do
    context 'when the user is an admin' do
      let(:current_user) { admin }
      let(:valid_attributes) { attributes_for(:drone).merge(user_id: user.id) }
      let(:invalid_attributes) { { name: '', serial_number: '' } }

      context 'with valid attributes' do
        it 'creates a new drone' do
          expect do
            post :create, params: { drone: valid_attributes }
          end.to change(Drone, :count).by(1)
        end

        it 'returns a successful response' do
          post :create, params: { drone: valid_attributes }
          expect(response).to have_http_status(:created)
        end
      end

      context 'with invalid attributes' do
        it 'does not create a new drone' do
          expect do
            post :create, params: { drone: invalid_attributes }
          end.not_to change(Drone, :count)
        end

        it 'returns an unprocessable entity response' do
          post :create, params: { drone: invalid_attributes }
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it 'returns error messages' do
          post :create, params: { drone: invalid_attributes }
          json_response = response.parsed_body
          expect(json_response['errors']).to be_present
        end
      end
    end

    context 'when the user is not an admin' do
      let(:current_user) { user }

      it 'returns a forbidden response' do
        post :create, params: { drone: attributes_for(:drone) }
        expect(response).to have_http_status(:forbidden)
      end
    end
  end

  describe 'PUT #update' do
    let(:drone) { create(:drone) }

    context 'when the user is an admin' do
      let(:current_user) { admin }
      let(:new_attributes) { { name: 'NewName' } }

      it 'updates the drone' do
        put :update, params: { id: drone.id, drone: new_attributes }
        drone.reload
        expect(drone.name).to eq('NewName')
      end

      it 'returns a successful response' do
        put :update, params: { id: drone.id, drone: new_attributes }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when the user is not an admin' do
      let(:current_user) { user }

      it 'returns a forbidden response' do
        put :update, params: { id: drone.id, drone: { name: 'NewName' } }
        expect(response).to have_http_status(:forbidden)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:drone) { create(:drone) }

    context 'when the user is an admin' do
      let(:current_user) { admin }

      it 'deletes the drone' do
        expect do
          delete :destroy, params: { id: drone.id }
        end.to change(Drone, :count).by(-1)
      end

      it 'returns a successful response' do
        delete :destroy, params: { id: drone.id }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when the user is not an admin' do
      let(:current_user) { user }

      it 'returns a forbidden response' do
        delete :destroy, params: { id: drone.id }
        expect(response).to have_http_status(:forbidden)
      end
    end
  end
end
