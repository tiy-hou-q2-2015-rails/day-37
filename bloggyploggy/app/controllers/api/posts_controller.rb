class Api::PostsController < ApplicationController

  before_action do
    # if request.headers["x-api-key"] != "04376553a9e9cd9c"
    if params["token"] != "04376553a9e9cd9c"
      render json: {error: "x-api-key not found"}, status: 401
    end
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id]
    if @post.update params.require(:post).permit(:title, :body, :published)
      render :show, status: 200
    else
      render json: @post.errors, status: 422
    end
  end

  def create

    # {
    #   post: {
    #     title: "the title",
    #     body: "the body",
    #     publised: true
    #   }
    # }

    @post = Post.new params.require(:post).permit(:title, :body, :published)
    if @post.save
      render :show, status: 201
    else
      render json: @post.errors, status: 422
    end
  end

  def delete
    @post = Post.find params[:id]
    if @post.destroy
      render :show, status: 200
    else
      render json: @post.errors, status: 422
    end
  end
end
