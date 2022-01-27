class ReviewsController < ApplicationController
  before_action :find_coworking

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.coworking_id = @coworking.id
    @review.user_id = current_user.id

    if @review.save
    else
      render 'new'
    end

    redirect_to coworking_path(@coworking)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end

  def find_coworking
    @coworking = Coworking.find(params[:coworking_id])
  end
end
