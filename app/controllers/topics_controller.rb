class TopicsController < ApplicationController
  def new
    @topic = Topic.new
  end


  def create
    @topic = current_user.topics.new(topic_params)
    if @topic.save
      redirect_to topics_path, notice: '投稿に成功しました'
    else
      flash.now[:alert] = "投稿に失敗しました"
    end
  end

  def index
    @topics = Topic.all
    # debugger
  end

  def edit
    # debugger
    @topic = Topic.find_by(id: params[:id])
  end

  def update
    @topic = Topic.find_by(id: params[:id])
    # debugger
    if @topic.update(topic_params)   #= current_user.topics.update(topic_params)
      redirect_to topics_path, notice: '編集を完了しました。'
    else
      render :edit
    end
  end


  def destroy
    @topic = Topic.find_by(id: params[:id])
    if @topic.delete
    redirect_to topics_path
    else
    render topics_path

    end
  end

  private
  def topic_params
    params.require(:topic).permit(:image, :description)
  end



end
