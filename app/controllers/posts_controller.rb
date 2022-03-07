class PostsController < ApplicationController
  def index
    @new_post = Post.new
    @all_posts = Post.all.order(create_at: :desc)
  end

  def create
    @new_post = Post.new(post_params)
    if @new_post.save 
      redirect_to "/"
    else
      render "index"
    end
  end

  private
  def post_params
    params.require(:post).permit(:comment)
  end
end
