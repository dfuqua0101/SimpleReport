class CommentsController < ApplicationController
  http_basic_authenticate_with name: "dex", password: "1234", only: [:destroy]


  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    @comment.destroy
    redirect_to post_path(@post)
  end

  private def comment_params
    params.require(:comment).permit(:username, :body)
  end
end