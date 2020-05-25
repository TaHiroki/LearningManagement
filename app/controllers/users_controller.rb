class UsersController < ApplicationController
  def index
    @user = @current_user
    @comments = Comment.all.order(created_at: :desc).limit(3)

    @subjects = Subject.where(user_id: @current_user.id)
    @Masters = []
      @subjects.each do |subject|
        @a = Array.new(2)
        @boxes = []
        subject.count.times{ |n| @boxes << '<div class="box col-1 border border-dark" id='+"box#{n}"+'></div>' }
        @a[0] = subject.subject
        @a[1] = @boxes
        @Masters << @a
      end
  end

  def new
    @user = User.new
    @chapter = '新規登録'
  end

  def create
    @user = User.new(user_params)
    @user.delete_flag = 0

    if @user.save
      session[:user_id] = @user.id
      redirect_to users_url, notice: "ユーザー「#{@user.name}」を登録しました!"
    else
      render :new
    end
  end

  def show
    @user = @current_user
  end

  def edit
    @user = @current_user
    @chapter = 'アカウント編集'
  end

  def update
    @user = @current_user
    
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "ユーザー「#{@user.name}」を更新しました!"
    else
      render :edit
    end
  end

  def destroy
    @user = @current_user
    @user.delete_flag = 1
    @user.save
    session[:user_id] = nil
    redirect_to login_users_path, notice: "ユーザーを削除しました"
  end

  def login
  end

  def loginpage
    @user = User.find_by(email: params[:email])

    if @user&.authenticate(params[:password]) && @user.delete_flag == 0
      session[:user_id] = @user.id
      redirect_to users_path, notice: "#{@user.name}様、ログインしました！"
    elsif @user&.authenticate(params[:password]) && @user.delete_flag == 1
      flash[:notice] = '削除されたアカウントです。'
      render :login
    else
      flash[:notice] = '入力内容に間違いがあるか、未入力な箇所があります。'
      render :login
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to login_users_path, notice: "ログアウトしました。"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :introduction, :password_confirmation, :image)
  end

end
