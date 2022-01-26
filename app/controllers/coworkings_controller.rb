class CoworkingsController < ApplicationController
  before_action :set_coworking, only: ["update", "edit", "destroy"]

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
  end

  def update
    @coworking.update(coworking_params)
    redirect_to coworking_path(@coworking)
  end

  def destroy
    @coworking.destroy
    redirect_to root_path
  end

  private

  def set_coworking
    @coworking = Coworking.find(params[:id])
  end

  def coworking_params
    params.require(:coworking).permit(:name, :address, :description, :price, :capacity, :photo, photos: [])
  end
end
