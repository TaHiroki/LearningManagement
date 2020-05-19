class CommentsController < ApplicationController
  def index
    @comments = Comment.all
    @user = User.find(1)
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = 1

    if @comment.save
      redirect_to comments_path, notice: "コメントを投稿しました！"
    else
      render :new
    end
  end

  def show
    @comment = Comment.find(params[:id])
    @replies = Reply.all
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to comments_path, notice: "コメントを削除しました。"
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
