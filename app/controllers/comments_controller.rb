class CommentsController < ApplicationController
  def index
    @comments = Comment.all
    @user = User.find(1)
  end
end
