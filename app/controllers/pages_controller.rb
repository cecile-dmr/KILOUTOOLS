class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def dashboard
    @user = current_user
    # booking for tools the user wants to rent
    @user_bookings = Booking.where(user: @user);

    # bookings for which the user is the owner
    @owner_bookings = Booking.includes(tool: :user).where(tools: { user: current_user })
  end
end


