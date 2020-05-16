class UsersController < ApplicationController
  def index
    @user = User.find(1)

    @boxes = Array.new(10)
    10.times{ |n| @boxes << '<div class="box col-1 border border-dark" id='+"box#{n}"+'></div>' }
                            
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: "ユーザー「#{@user.name}」を登録しました!"
    else
      render :new
    end
  end

  def login
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
