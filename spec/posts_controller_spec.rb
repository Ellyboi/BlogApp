require 'rails_helper'

RSpec.describe 'PostsController', type: :request do
  describe 'GET #index' do
    it 'returns http success' do
      get user_posts_path(user_id: 1)

      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
      expect(response.body).to include("Placeholder text for posts index")
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get user_post_path(user_id: 1, id: 1)

      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
      expect(response.body).to include("Placeholder text for post 1")
    end
  end
end
