class EntriesController < ApplicationController
	def index
		@entries = Entry.all
		render :index
	end

	def new
		@entries = Entry.new
	end

	def create
		@entry = Entry.new(entry_params)
		if @entry.save
			redirect_to '/'
		else
		flash[:error] = "Successfully failed bit..."
		redirect_to new_entry_path
		end
	end

	def show
		@entry = Entry.find(params[:id])
		render :show
	end

	private
	def entry_params
		params.require(:entry).permit(:title, :body)
	end
end
