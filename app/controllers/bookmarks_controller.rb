class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [:destroy]
  before_action :set_list, only: [:show]

  def new
    @bookmark = Bookmark.new
    @movies = Movie.all
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = @list.bookmarks.build(bookmark_params)

    if @bookmark.save
      redirect_to @list, notice: 'Movie was successfully added to the list.'
    else
      render :new
    end
  end


  def destroy
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other

  end

 private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

  def set_bookmark
    @Bookmark = Bookmark.find(params[:bookmark_id])
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end
