class Api::CommentsController < ApplicationController

  def create


    @comment = Comment.new params.require(:comment).permit(:post_id, :author, :content)
    if @comment.save
      @post = @comment.post
      render "api/posts/show", status: 201
    else
      render @comment.errors, status: 422
    end

  end

  def delete
    @comment = Comment.find params[:id]
    if @comment.destroy
      @post = @comment.post
      render "api/posts/show", status: 200
    else
      render @comment.errors, status: 422
    end
  end
end
