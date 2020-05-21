class FriendsController < ApplicationController
  def index
    users = Friend.where(master: @current_user).order(created_at: :desc)
    @friends = []
    users.each do |user|
      @friends << User.find(user.user_id)
    end
  end

  def show
    @friend = User.find(params[:id])
  end
end
