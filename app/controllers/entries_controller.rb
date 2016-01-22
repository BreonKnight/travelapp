class EntriesController < ApplicationController
  before_action :logged_in?, except: [:index, :show]

  def index
    @city = City.find_by_id(params[:city_id])
    @entries = @city.entries
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    @city = City.find_by_id(params[:city_id])
    @entry.city = @city
    @entry.user = current_user
    if @entry.save
      redirect_to city_path(@city)
    else
      redirect_to new_city_entry_path
    end
  end

  def show
    @entry = Entry.find(params[:id])
    @user = @entry.user
    if @entry.city == City.find_by_id(params[:city_id])
      render :show
    else
      redirect_to city_path(@entry.city)
    end
  end

  def edit
    entry_id = params[:id]
    @entry = Entry.find_by_id(entry_id)
    @user = @entry.user
    if current_user == @user
      render :edit
    else
      redirect_to profile_path
    end
  end

  def update
    entry_id = params[:id]
    entry = Entry.find_by_id(entry_id)
    user = entrry.user
    if current_user == user
      redirect_to city_entry_path(entry.city, entry)
      entry.update_attributes(entry_params)
    else
      redirect_to profile_path
    end
  end

  def destroy
    entry_id = params[:id]
    entry = Entry.find_by_id(entry_id)
    entry.destroy
    redirect_to profile_path
  end

  private

  def entry_params
    params.require(:entry).permit(:title, :body)
  end
end
