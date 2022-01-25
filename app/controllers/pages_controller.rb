class PagesController < ApplicationController
  def home
    @coworkings = Coworking.all
  end

  def my_visits
    if user_signed_in?
      @bookings = current_user.bookings
    else
      redirect_to new_user_session_path
    end
  end

  def my_rentals
    if user_signed_in?
      @coworkings = current_user.coworkings
    else
      redirect_to new_user_session_path
    end
  end
end
