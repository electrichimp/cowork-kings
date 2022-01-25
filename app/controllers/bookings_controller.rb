class BookingsController < ApplicationController
  before_action :set_booking, only: ["destroy", "confirm"]
  def create
    @booking = Booking.new(booking_params)
    @booking.coworking = Coworking.find(params[:coworking_id])
    @booking.user = current_user
    @booking.accepted = false
    if @booking.save
      redirect_to my_visits_path
    else
      render "bookings/show"
    end
  end

  def destroy
    @booking.destroy
    redirect_to my_rentals_path
  end

  def confirm
    @booking.accepted = true
    @booking.save
    redirect_to my_rentals_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
