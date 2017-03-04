class Topics::PostsController < ApplicationController
  before_action :set_topic, except: [:new, :create]
  before_action :set_post, only: [:show, :edit, :update]

  def index
    @posts = @topic.posts
  end

  def new
  end

  def create
    post = Post.new(post_params)
    post.user_id = current_user.id

    if post.save
      redirect_to topic_post_path(topic_id: post.topic_id, id: post), notice: 'Your post was successfully published.'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @post = @topic.posts.find(params[:id])

    if @post.update(post_params)
      redirect_to topic_post_path(topic_id: @post.topic_id, id: @post), notice: 'Your post was successfully updated.'
    else
      render :edit, notice: 'There was an error processing your request!'
    end
  end

  private

  def set_topic
    @topic = Topic.friendly.find(params[:topic_id])
  end

  def set_post
    @post = @topic.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :topic_id)
  end
end
