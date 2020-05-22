class FriendsController < ApplicationController
  def index #フレンド一覧
    users = Friend.where(master: @current_user).order(created_at: :desc)
    @friends = []
    users.each do |user|
      @friends << User.find(user.user_id)
    end
  end

  def new #フレンド検索
    @friends = []
    @friends << User.find(params[:friend_id])
    render :index
  end

  def edit #ユーザー全検索
    @friends = User.all.order(created_at: :desc)
    render :index
  end

  def show #フレンド詳細
    @friend = User.find(params[:id])
  end

  def create #フレンドになる
  end

  def delete #フレンドやめる
  end

end
