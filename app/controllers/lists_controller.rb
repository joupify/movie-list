class ListsController < ApplicationController
  before_action :set_list, only: [:show]

  def index
    @list = List.all
  end

  def show
    @bookmark = Bookmark.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list), notice: "successfully created"
    else
      render new, status: :unprocessable_entity
    end
  end


  def destroy
    @list.destroy
    redirect_to lists_path, status: :see_other
  end
  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    param.require(:list).permit(:name)
  end
end
