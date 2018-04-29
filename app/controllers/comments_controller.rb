class CommentsController < ApplicationController
  def new
    # debugger
    @comment = Comment.new

  end


  def create
    # debugger
    @topic = Topic.find_by(id: params[:id])
    debugger
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.topic_id = @topic.id

    # debugger  user_id: current_user.id, , topic_id: params[:topic_id]
    if @comment.save

      redirect_to topics_path

    else
      # debugger
      render :new
    end

  end

  private
  def comment_params
    params.require(:comment).permit(:comment_text, :topic_id)
  end


end
