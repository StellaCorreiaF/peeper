class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_user!, only: [:update, :destroy]
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :set_user, only: [:create]
 
  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  def create
    @post = Post.new(post_params)    
    @post.user = @user

    respond_to do |format|
      if @post.save
        format.html { redirect_to root_path, notice: t('new-post') }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: t('edit_post') }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: t('post_destroy') }
      format.json { head :no_content }
    end
  end

  private


  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit( :user_id, :body, :topic_id )
  end

  def set_user
    if user_signed_in?
      @user = current_user
    else
      @user = User.find_or_create_by(email: 'generic@example.com.br') do |user|
        user.name = 'artois'
        user.password = '12345567'
      end
    end
  end
end
