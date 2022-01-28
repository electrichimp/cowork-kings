class ReviewsController < ApplicationController
  before_action :find_coworking

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.coworking = @coworking
    @review.user = current_user
    @booking = Booking.new

    if @review.save
      redirect_to coworking_path(@coworking)
    else
      render 'coworkings/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end

  def find_coworking
    @coworking = Coworking.find(params[:coworking_id])
  end
end
