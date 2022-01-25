class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @booking.coworking = Coworking.find(params[:coworking_id])
    @booking.user = current_user
    if @booking.save
      redirect_to my_visits_path
    else
      render "bookings/show"
    end
  end

  def destroy
  end

  def confirm
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
