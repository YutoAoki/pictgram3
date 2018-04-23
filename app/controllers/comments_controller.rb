class CommentsController < ApplicationController
  def new
    @comment = Comment.new

  end


  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.topic_id = params[:topic_id]
    # debugger  user_id: current_user.id, , topic_id: params[:topic_id]
    if @comment.save
      redirect_to root_path

    else
      redirect_to topics_path
    end

  end

  private
  def comment_params
    params.require(:comment).permit(:comment_text)
  end


end
