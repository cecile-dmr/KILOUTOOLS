class ToolsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      @tools = Tool.where("name ILIKE ? OR description ILIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
    else
      @tools = Tool.all
    end

    @tools = @tools.where.not(user: current_user)

    @markers = @tools.geocoded.map do |tool|
      {
        lat: tool.latitude,
        lng: tool.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {tool: tool}),
        marker_html: render_to_string(partial: "marker", locals: {tool: tool})
      }
    end
  end

  def show
    @tool = Tool.find(params[:id])
    @booking = Booking.new
  end

  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.new(tool_params)
    @tool.user = current_user
    if @tool.save
    redirect_to tool_path(@tool)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @tool = Tool.find(params[:id])
  end

  def update
    @tool = Tool.find(params[:id])
    if @tool.update(tool_params)
      #flash[:success] = "Tool updated!"
      redirect_to dashboard_path, notice: "Outil mis à jour !"
    else
      render action :edit
    end
  end

  def destroy
    @tool = Tool.find(params[:id])
    if @tool.bookings.all? { |booking| booking.end_date < Date.today || booking.status == "Refusée" || booking.status == "En attente" }
      @tool.destroy
      redirect_to dashboard_path, status: :see_other
    else
      redirect_to tool_path(params[:id]), alert: "Vous avez encore des locations en cours !"
    end
  end

  private

  def tool_params
    params.require(:tool).permit(:name, :price, :description, :photo, :address)
  end
end
