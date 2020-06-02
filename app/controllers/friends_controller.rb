class FriendsController < ApplicationController
  def index #フレンド一覧
    users = Friend.where(master: @current_user).order(created_at: :desc)
    fd = []
    users.each do |user|
      fd << User.find(user.user_id)
    end
    @friends = Kaminari.paginate_array(fd).page(params[:page]).per(10)
    @name = 'フォロー一覧'
  end

  def new #フレンド検索
    @friends = []
    @friends << User.find(params[:friend_id])
    render :index
  end

  def edit #ユーザー全検索
    @friends = User.page(params[:page]).per(10).order(created_at: :desc)
    @name = '全ユーザー一覧'
    render :index
  end

  def show #フレンド詳細
    @friend = User.find(params[:id])
  end

  def create #フレンドになる
    friend = Friend.new(master: @current_user.id, user_id: params[:id])
    friend.save
    session[:friends] = Friend.where(master: @current_user.id).count
    redirect_to friends_path, notice: "ユーザー：#{User.find(params[:id]).name}さんをフォローしました！"
  end

  def destroy #フレンドやめる
    friend = Friend.find_by(master: @current_user.id, user_id: params[:id])
    friend.destroy
    session[:friends] = Friend.where(master: @current_user.id).count
    redirect_to friends_path, notice: "ユーザー：#{User.find(params[:id]).name}さんのフォローをやめました。"
  end

end
