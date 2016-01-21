class CitiesController < ApplicationController

	def index
		@cities = City.all
	end

	def new
		@city = City.new
	end

	def create
		@city = City.new(city_params)
		if @entry.save
      redirect_to city_path
    else
    flash[:error] = "Successfully failed but..."
    redirect_to new_city_path
    end
	end

	def show
		@city = City.find(params[:id]) 
	end

	private

  def city_params
    params.require(:city).permit(:name, :country)
  end

end
