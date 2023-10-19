class WelcomeController < ApplicationController
	def index
		@posts = Post.all
		@topics = Topic.all
	end
end