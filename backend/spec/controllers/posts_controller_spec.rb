require 'rails_helper'

RSpec.describe PostsController, type: :controller do
	before do
    @user = User.create(email: 'user@example.com', password: 'password')  # Crie um usuário manualmente
    sign_in @user
  end

  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end    
  end 

  describe 'GET #new' do
    it 'returns a successful response' do
      get :new
      expect(response).to be_successful
    end

    
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new post' do
        post_params = { body: 'Texto do post' }
        expect {
          post :create, params: { post: post_params }
        }.to change(Post, :count).by(1)
      end

      it 'redirects to the root path' do
        post_params = { body: 'Texto do post' }
        post :create, params: { post: post_params }
        expect(response).to redirect_to(root_path)
      end
    end    
  end
end
