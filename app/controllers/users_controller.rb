class UsersController < ApplicationController
  def index
    @user = User.find(1)

    @boxes = Array.new(10)
    10.times{ |n| @boxes << '<div class="box col-1 border border-dark" id='+"box#{n}"+'></div>' }
                            
  end

  def new
    @user = User.new
    @chapter = '新規登録'
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: "ユーザー「#{@user.name}」を登録しました!"
    else
      render :new
    end
  end

  def edit
    @user = User.find(1)
    @chapter = 'アカウント編集'
  end

  def update
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "ユーザー「#{@user.name}」を更新しました!"
    else
      render :edit
    end
  end

  def login
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :introduction)
  end

end
