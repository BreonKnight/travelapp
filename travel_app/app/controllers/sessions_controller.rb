class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
  	user_params = params.require(:user).permit(:email, :password)
  	@user = User.find_by_email(user_params[:email])
    # If the user exists AND the password entered is correct.
    if @user && @user.authenticate(user_params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:user_id] = @user.id
      flash[:notice] = "Successfully logged in."
      redirect_to user_path(@user)
    else
      flash[:error] = "Incorrect email or password."
      redirect_to "/login"
    end
  end

end
