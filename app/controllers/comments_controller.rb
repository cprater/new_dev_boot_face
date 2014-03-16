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

  def edit
    @comment = Comment.where(id: params[:id]).first
  end

  def show
    @comment = Comment.where(id: params[:id]).first
  end

  def update
    @comment = Comment.where(id: params[:id]).first
    if @comment.update(params[:comment].permit(:content))
      redirect_to post_path(session[:current_post])
    else
      render 'edit'
    end   
  end

  def destroy
    Comment.delete(params[:id])
    redirect_to posts_path
  end

  private

  def comment_params
    params.require(:comment).permit(:content,:user_id,:commentable_id, :commentable_type)
  end
end
