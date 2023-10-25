class WelcomeController < ApplicationController
	def index
		@posts = Post.order(created_at: :desc).all
		@topics = Topic.all
	end
end