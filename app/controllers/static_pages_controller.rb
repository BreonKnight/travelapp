class StaticPagesController < ApplicationController
	def homepage
		@cities = City.all
	end
end
