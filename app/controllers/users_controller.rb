class UsersController < ApplicationController
  def index
    @user = User.find(1)

    @boxes = Array.new(10)
    10.times{ |n| @boxes << '<div class="box col-1 border border-dark" id='+"box#{n}"+'></div>' }
                            
  end

  def login
  end
end
