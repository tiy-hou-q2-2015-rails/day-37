class HomeController < ApplicationController
  def index
    @posts = Post.where(published: true).order("created_at desc")
  end
end
