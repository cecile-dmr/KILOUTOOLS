class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def dashboard
    # bookings that the user booked
    @user = current_user
    # bookings for which the user is the owner
    @owner_bookings = Booking.includes(tool: :user).where(users: {id: current_user})
  end

  def ads_user
    @ads_user = Ad.find(current_user.id)
  end
end
