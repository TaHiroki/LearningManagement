class CommentsController < ApplicationController
  def index
    @comments = Comment.page(params[:page]).per(10).order(created_at: :desc)
    @user = @current_user
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = @current_user.id

    if @comment.save
      redirect_to comments_path, notice: "コメントを投稿しました！"
    else
      render :new
    end
  end

  def show
    @comment = Comment.find(params[:id])
    @replies = Reply.page(params[:page]).per(10).order(created_at: :desc)
    @count = Fite.where(comment_id: @comment.id).count

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
