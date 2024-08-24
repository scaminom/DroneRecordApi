require 'rails_helper'

RSpec.describe Api::V1::UsersController do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns a successful response' do
      get :index, format: :json
      expect(response).to have_http_status(:ok)
    end

    it 'returns all users' do
      create_list(:user, 3)
      get :index, format: :json
      json_response = response.parsed_body
      expect(json_response['data']['users'].length).to eq(4)
    end
  end
end
