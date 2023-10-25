class WelcomeController < ApplicationController
	def index
		@posts = Post.order(created_at: :desc).all
		@topics = Topic.all
		@random_users = User.all.sample(5) 
		@topics_with_posts = Topic.joins(:posts).distinct

	end
end