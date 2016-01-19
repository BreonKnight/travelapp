class UserController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    user_params = params.require(:user).permit(:first_name, :last_name, :email, :password, :current_city)
    @user = User.new(user_params)

    if @user.save
      redirect_to user_path(@user)
  end

end
