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

  def edit
    entry_id = params[:id]
    @entry = Entry.find_by_id(entry_id)
    render :edit  
  end

  def update
    entry_id = params[:id]

    entry = Entry.find_by_id(entry_id)

    entry.update_attributes(entry_params)
    redirect_to entry_path(entry)
  end

  def destroy
    entry_id = params[:id]
    entry = Entry.find_by_id(entry_id)

    entry.destroy

    redirect_to entries_path

  end

  private
  def entry_params
    params.require(:entry).permit(:title, :body)
  end
end
