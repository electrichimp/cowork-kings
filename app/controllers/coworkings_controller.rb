class CoworkingsController < ApplicationController
  # before_action: set_coworking

  def new
    @coworking = Coworking.new
  end

  def create
    @coworking = Coworking.new(coworking_params)
    @coworking.user = current_user
    if @coworking.save
      redirect_to coworking_path(@coworking)
    else
      render :new
    end
  end

  def show
    @coworking = Coworking.find(params[:id])
    @booking = Booking.new
  end

  def edit
    @coworking = Coworking.find(params[:id])
  end

  # def update
  #   restaurant = Restaurant.find(params[:id])
  #   restaurant.update(restaurant_params)
  #   redirect_to restaurant_path(restaurant)
  # end

  private

  def coworking_params
    params.require(:coworking).permit(:name, :address, :description, :price, :capacity)
  end
end
