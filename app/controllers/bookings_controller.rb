class BookingsController < ApplicationController

  def create
    @booking = Booking.new(booking_params)
    tool = Tool.find(params[:tool_id])
    @booking.user = current_user
    @booking.tool = tool
    number_of_days = (@booking.end_date - @booking.start_date).to_i
    @booking.status = "En attente"
    redirect_to dashboard_path if @booking.save
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(dashboard_params)
    if params[:status] == "Acceptée"
      redirect_to dashboard_path
      flash[notice:]
    elsif params[:status] == "Refusée"
      redirect_to dashboard_path, notice: "La location a bien été refusée"
      flash[notice:]
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def dashboard_params
    params.permit(:status)
  end

end
