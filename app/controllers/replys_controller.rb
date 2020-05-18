class ReplysController < ApplicationController
  def new
    @reply = Reply.new
    @comment = Comment.find(params[:re])
  end
end
