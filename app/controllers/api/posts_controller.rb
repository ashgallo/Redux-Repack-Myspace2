class Api::PostsController < ApplicationController
#Ruby 
#current_user is devise

  def index
    @posts = current_user.posts.all #this is a active record call to the db (sql query)
    render json: @posts #render as a json
  end

  def show
  end

  def update
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      render json: @post_params
    else
      message = "It didn't work"
      render json: message
    end
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end

end

