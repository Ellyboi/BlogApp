require 'rails_helper'

RSpec.describe 'UsersController', type: :request do
  describe 'GET #index' do
    it 'returns http success' do
      get users_path

      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
      expect(response.body).to include("Placeholder text for users index")
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get user_path(1)

      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
      expect(response.body).to include("Placeholder text for user 1")
    end
  end
end
