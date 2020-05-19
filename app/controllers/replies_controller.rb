class RepliesController < ApplicationController
  def new
    @reply = Reply.new
    @comment = Comment.find(params[:re])
  end

  def create
    @reply = Reply.new(reply_params)
    @comment = Comment.find(re_params["re"])
    flash[:notice] = "コメントに返信しました！"
    render template: "comments/show"
  end

  private

  def reply_params
    params.require(:reply).permit(:reply)
  end

  def re_params
    params.require(:reply).permit(:re)
  end
end
