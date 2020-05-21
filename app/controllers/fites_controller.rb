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
    @comments = Comment.all
    @replies = Reply.all
    @count = Fite.where(comment_id: @comment.id).count
    if session[:page] == 1
      session[:page] = nil
      render template: "comments/index"
    else
      session[:page] = nil
      render template: "comments/show"
    end
  end
end
