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

    redirect_to comments_path, notice: "コメントを投稿しました！"
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
