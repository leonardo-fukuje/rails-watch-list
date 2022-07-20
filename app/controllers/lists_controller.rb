class ListsController < ApplicationController
  # before_action :set_list, only: [:show]

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = @list.bookmarks
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path(@list)
    else
      render :new
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to lists_path
  end

  private

  # def set_list
  #   @list = List.find(params[:id])
  # end

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
