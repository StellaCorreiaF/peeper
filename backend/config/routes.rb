Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: "registrations" }  

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'    
  end

  resources :users, only: [:show, :index] 

  resources :posts do
    resources :comments
    get 'comments', to: 'comments#index', on: :member, as: 'show_comments'
  end

  resources :topics do
    get 'posts', on: :member
  end
  
  resources :posts do
    get 'topic/:id', action: :show_topic_posts, on: :collection, as: :topic_posts
  end
  

  resources :comments
  root to: "welcome#index"
  


 
  
end
