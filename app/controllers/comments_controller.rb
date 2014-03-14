class CommentsController < ApplicationController
  def new
    @post_id = params[:post_id]
    @user_id = current_user.id
    @comment = Comment.new()
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to "/posts/#{params[:commentable_id]}"
    else
      render 'new'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content,:user_id,:commentable_id, :commentable_type)
  end
end
