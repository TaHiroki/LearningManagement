class RepliesController < ApplicationController
  def new
    @reply = Reply.new
    @comment = Comment.find(params[:re])
  end

  def create
    @reply = Reply.new(reply_params)
    @comment = Comment.find(re_params["re"])
    @reply.comment_id = @comment.id
    
    if @reply.save
      redirect_to comment_path(@comment), notice: "コメントに返信しました！"
    else
      render :new
    end
  end

  private

  def reply_params
    params.require(:reply).permit(:reply)
  end

  def re_params
    params.require(:reply).permit(:re)
  end
end
