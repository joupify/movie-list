class ReviewsController < ApplicationController
  before_action :set_review, only: [:destroy]


  def create
    @list = List.find(params[:list_id])
    @review = Review.new(review_params)
    @review.list = @list

    if @review.save
      redirect_to list_path(@list), notice: "review added"
    else
      @bookmark = Bookmark.new
      render 'show/list', status: :unprocessable_entity
    end
  end

  def destroy
    @reviews.destroy
    redirect_to list_path(@review.list)
  end


  private

    def set_review
      @review = Review.find(param[:id])
    end

    def review_params
      params.require(:review).permit(:comment, :rating)
    end

end
