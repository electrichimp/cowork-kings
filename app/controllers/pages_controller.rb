class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    if params[:query].present?
      @coworkings = Coworking.search_by_name_and_address_and_description(params[:query])
    else
      @coworkings = Coworking.all
    end

    @markers = @coworkings.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        info_window: render_to_string(partial: "info_window", locals: { flat: flat })
      }
    end
  end

  def my_coworkings
    if user_signed_in?
      @coworkings = current_user.coworkings
    else
      redirect_to new_user_session_path
    end
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
      @bookings = current_user.coworkings.map {|coworking| coworking.bookings}.flatten
    else
      redirect_to new_user_session_path
    end
  end
end
