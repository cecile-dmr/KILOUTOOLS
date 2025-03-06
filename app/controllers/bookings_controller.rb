class BookingsController < ApplicationController

  def create
    @booking = Booking.new(booking_params)
    tool = Tool.find(params[:tool_id])
    @booking.user = current_user
    @booking.tool = tool
    @booking.status = :pending
    redirect_to dashboard_path if @booking.save
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
