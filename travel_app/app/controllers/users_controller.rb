class UsersController < ApplicationController
  before_action :set_user, except: [:index, :new, :create]

  def index
  end

  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:first_name, :last_name, :email, :password, :current_city)
    @user = User.new(user_params)

    if @user.save
      login(@user)
      redirect_to user_path(@user)
    else
      flash[:error] = @user.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end

  def show
    @entries = @user.entries
    # @entries.each do |entry|
    #   @city = entry.city
    # end
  end

  def edit
    if current_user == set_user
      render :edit
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    user_params = params.require(:user).permit(:first_name, :last_name, :current_city_id, :avatar)
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      flash[:error] = @user.errors.full_messages.join(", ")
      redirect_to edit_user_path(@user)
    end

  end

  private

  def set_user
    user_id = params[:id] || current_user.id
    @user = User.find_by_id(user_id)
  end

end
