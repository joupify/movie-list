class ListsController < ApplicationController
  before_action :set_list, only: [:show, :destroy]

  def index
    if params[:search].present?
      search_query = params[:search]
      @movies = Movie.where("title ILIKE ?", "%#{search_query}%").sort_by { |movie| movie.title.casecmp(search_query) }
    else
      @movies = Movie.all
    end
    @lists = List.all
  end



  def show
    @bookmark = Bookmark.new
    @list = List.find(params[:id])
    @review = Review.new


  end

  def new
    @list = List.new
    @list.photo = params[:file]
  end

  def create
    @list = List.new(list_params)
    list.photo = params[:list][:photo]


    raise
    if @list.save
      redirect_to list_path(@list), notice: "list successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end


  def destroy
    @list.destroy
    redirect_to lists_path(@list), status: :see_other
  end
  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
