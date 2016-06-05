class PostsController < ApplicationController

  def index
    @posts = Post.order(:created_at)
  end

  def new
  end

  def create
    if current_user
      post = Post.new(post_params)
      post.user_id = current_user.id if current_user
      post.votes = 1
      post.save
      redirect_to posts_path
    else
      flash.notice = "Must be logged in to create post!"
      redirect_to posts_path
    end

  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  def vote
    if current_user
      @post = Post.find(params[:id])
      @post.votes += 1
      @post.save
      redirect_to posts_path
    else
      flash.notice = "Must be logged in to vote!"
      redirect_to posts_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @post = Post.find(params[:id])
    if current_user && current_user == @post.submitter
      @post.destroy
      redirect_to posts_path
    else
      flash.notice = "Can't delete other's posts!!"
      redirect_to posts_path
    end
  end

private

  def post_params
    params.require(:post).permit(:title, :url)
  end

end
