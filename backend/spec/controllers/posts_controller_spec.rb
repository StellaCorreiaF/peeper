# spec/controllers/posts_controller_spec.rb

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end

    it 'assigns all posts to @posts' do
      post = create(:post)
      get :index
      expect(assigns(:posts)).to eq([post])
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      post = create(:post)
      get :show, params: { id: post.id }
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a successful response' do
      get :new
      expect(response).to be_successful
    end

    it 'assigns a new post to @post' do
      get :new
      expect(assigns(:post)).to be_a_new(Post)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new post' do
        post_params = attributes_for(:post)
        expect {
          post :create, params: { post: post_params }
        }.to change(Post, :count).by(1)
      end

      it 'redirects to the root path' do
        post_params = attributes_for(:post)
        post :create, params: { post: post_params }
        expect(response).to redirect_to(root_path)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new post' do
        post_params = attributes_for(:post, body: nil)
        expect {
          post :create, params: { post: post_params }
        }.not_to change(Post, :count)
      end

      it 'renders the new template' do
        post_params = attributes_for(:post, body: nil)
        post :create, params: { post: post_params }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET #edit' do
    it 'returns a successful response' do
      post = create(:post)
      get :edit, params: { id: post.id }
      expect(response).to be_successful
    end
  end

  describe 'PUT #update' do
    let(:post) { create(:post) }

    context 'with valid parameters' do
      it 'updates the post' do
        put :update, params: { id: post.id, post: { body: 'Updated body' } }
        post.reload
        expect(post.body).to eq('Updated body')
      end

      it 'redirects to the post page' do
        put :update, params: { id: post.id, post: { body: 'Updated body' } }
        expect(response).to redirect_to(post_url(post))
      end
    end

    context 'with invalid parameters' do
      it 'does not update the post' do
        put :update, params: { id: post.id, post: { body: nil } }
        post.reload
        expect(post.body).not_to be_nil
      end

      it 'renders the edit template' do
        put :update, params: { id: post.id, post: { body: nil } }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the post' do
      post = create(:post)
      expect {
        delete :destroy, params: { id: post.id }
      }.to change(Post, :count).by(-1)
    end

    it 'redirects to the posts index' do
      post = create(:post)
      delete :destroy, params: { id: post.id }
      expect(response).to redirect_to(posts_url)
    end
  end
end
