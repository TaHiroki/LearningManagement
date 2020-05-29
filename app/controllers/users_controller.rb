class UsersController < ApplicationController
  skip_before_action :login_required, only: [:login, :loginpage, :new, :create, :easylogin]


  def index
    @user = @current_user
    @comments = Comment.all.order(created_at: :desc).limit(3)
    session[:friends] = Friend.where(master: @current_user.id).count
    session[:sb] = Subject.where(user_id: @current_user.id).count
    @explanation = 1

    subjects = Subject.where(user_id: @current_user.id).order(created_at: :asc)
    mt = []
      subjects.each do |subject|
        a = Array.new(2)
        @boxes = []
        subject.count.times{ |n| 
          if n < subject.flag
            @boxes << '<div class="box col-1 border border-dark" style="background-color:rgb(135, 206, 250)"><span>'+ "#{(n + 1)}" +'</span></div>' 
          else
            @boxes << '<div class="box col-1 border border-dark"><span>'+ "#{(n + 1)}" +'</span></div>' 
          end
        }
        a[0] = subject.subject
        a[1] = @boxes
        mt << a
        @Masters = Kaminari.paginate_array(mt).page(params[:page]).per(3)
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

  def easylogin
    @user = User.find_by(name: 'ユーザー１')
    session[:user_id] = @user.id
    redirect_to users_path, notice: "#{@user.name}様、ログインしました！これはお試しのアカウントです。"
  end

  def logout
    session[:user_id] = nil
    redirect_to login_users_path, notice: "ログアウトしました。"
  end

  def use
    @subjects = Subject.where(user_id: @current_user.id).order(created_at: :asc)
  end

  def boxsave
    subjects = Subject.where(user_id: @current_user.id).order(created_at: :desc)
    c = subjects.order(id: :desc).first.id
    c.times{|n|
      if params[:"#{n+1}"].present?
        subject = subjects.find(n+1)
        subject.flag = params[:"#{n+1}"]
        subject.save
      end
      }
    redirect_to users_path, notice: "進捗を保存しました！"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :introduction, :password_confirmation, :image)
  end

end