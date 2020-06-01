class RepliesController < ApplicationController
  def new
    @reply = Reply.new
    @comment = Comment.find(params[:re])
  end

  def create
    @reply = Reply.new(reply_params)
    @comment = Comment.find(re_params["re"])
    @reply.comment_id = @comment.id
    @reply.user_id = @current_user.id
    
    if @reply.save
      redirect_to comment_path(@comment), notice: "コメントに返信しました！"
    else
      render :new
    end
  end

  def destroy
    @reply = Reply.find(params[:id])
    @reply.destroy
    redirect_to comment_path(re_params["re"]), notice: "コメントを削除しました。"
  end

  private

  def reply_params
    params.require(:reply).permit(:reply)
  end

  def re_params
    params.require(:reply).permit(:re)
  end
end
