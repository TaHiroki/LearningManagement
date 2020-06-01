class FitesController < ApplicationController
  
  def create
    fite = Fite.new(user_id: @current_user.id, comment_id: params[:id])
    fite.save
    to_show    
  end

  def destroy
    fite = Fite.find_by(user_id: @current_user.id, comment_id: params[:id])
    fite.destroy
    to_show
  end

  def to_show
    @comment = Comment.find(params[:id])
    @comments = Comment.page(params[:page]).per(10).order(created_at: :desc)
    @replies = Reply.page(params[:page]).per(3).order(created_at: :desc)
    @count = Fite.where(comment_id: @comment.id).count
    @rp = Reply.page(params[:page]).per(3).order(created_at: :desc)
    if session[:page] == 1
      session[:page] = nil
      render template: "comments/index"
    else
      session[:page] = nil
      render template: "comments/show"
    end
  end
end
