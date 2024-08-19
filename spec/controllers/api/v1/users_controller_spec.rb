require 'rails_helper'

RSpec.describe Api::V1::UsersController do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    context 'when the user is an admin' do
      it 'returns a successful response' do
        get :index, format: :json
        expect(response).to have_http_status(:ok)
      end

      it 'returns all users' do
        create_list(:user, 3)
        get :index, format: :json
        expect(response.parsed_body.size).to eq(4)
      end
    end
  end

  # describe 'GET #show' do
  #   let(:user) { create(:user) }

  #   it 'returns a successful response' do
  #     get :show, params: { id: user.id }
  #     expect(response).to have_http_status(:ok)
  #   end

  #   it 'returns the correct user' do
  #     get :show, params: { id: user.id }
  #     json_response = JSON.parse(response.body)
  #     expect(json_response['user']['id']).to eq(user.id)
  #   end
  # end

  # describe 'POST #create' do
  #   let(:valid_attributes) { attributes_for(:user) }
  #   let(:invalid_attributes) { { username: '', email: '' } }

  #   context 'with valid attributes' do
  #     it 'creates a new user' do
  #       expect do
  #         post :create, params: { user: valid_attributes }
  #       end.to change(User, :count).by(1)
  #     end

  #     it 'returns a successful response' do
  #       post :create, params: { user: valid_attributes }
  #       expect(response).to have_http_status(:accepted)
  #     end
  #   end

  #   context 'with invalid attributes' do
  #     it 'does not create a new user' do
  #       expect do
  #         post :create, params: { user: invalid_attributes }
  #       end.not_to change(User, :count)
  #     end

  #     it 'returns an unprocessable entity response' do
  #       post :create, params: { user: invalid_attributes }
  #       expect(response).to have_http_status(:unprocessable_entity)
  #     end

  #     it 'returns error messages' do
  #       post :create, params: { user: invalid_attributes }
  #       json_response = JSON.parse(response.body)
  #       expect(json_response['errors']).to be_present
  #     end
  #   end
  # end

  # describe 'PUT #update' do
  #   let(:user) { create(:user) }
  #   let(:new_attributes) { { username: 'NewUsername' } }

  #   context 'with valid attributes' do
  #     it 'updates the user' do
  #       put :update, params: { id: user.id, user: new_attributes }
  #       user.reload
  #       expect(user.username).to eq('NewUsername')
  #     end

  #     it 'returns a successful response' do
  #       put :update, params: { id: user.id, user: new_attributes }
  #       expect(response).to have_http_status(:ok)
  #     end
  #   end

  #   context 'with invalid attributes' do
  #     let(:invalid_attributes) { { username: '' } }

  #     it 'does not update the user' do
  #       put :update, params: { id: user.id, user: invalid_attributes }
  #       user.reload
  #       expect(user.username).not_to eq('')
  #     end

  #     it 'returns an unprocessable entity response' do
  #       put :update, params: { id: user.id, user: invalid_attributes }
  #       expect(response).to have_http_status(:unprocessable_entity)
  #     end

  #     it 'returns error messages' do
  #       put :update, params: { id: user.id, user: invalid_attributes }
  #       json_response = JSON.parse(response.body)
  #       expect(json_response['errors']).to be_present
  #     end
  #   end
  # end

  # describe 'DELETE #destroy' do
  #   let!(:user) { create(:user) }

  #   it 'deletes the user' do
  #     expect do
  #       delete :destroy, params: { id: user.id }
  #     end.to change(User, :count).by(-1)
  #   end

  #   it 'returns a successful response' do
  #     delete :destroy, params: { id: user.id }
  #     expect(response).to have_http_status(:ok)
  #   end

  #   it 'returns a deletion message' do
  #     delete :destroy, params: { id: user.id }
  #     json_response = JSON.parse(response.body)
  #     expect(json_response['message']).to eq('user deleted successfully')
  #   end
  # end
end
