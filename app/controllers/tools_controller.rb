class ToolsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @tools = Tool.all
  end

  def show
    @tool = Tool.find(params[:id])
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
      redirect_to tool_path(@tool), notice: "Outil mis à jour !"
    else
      render action :edit
    end
  end

  def destroy
    @tool = Tool.find(params[:id])
    @tool.destroy
    redirect_to root_path, status: :see_other
  end

  def index
    @tools = Tool.all
    if params[:query].present?
      @tools = @tools.where("name ILIKE ?", "%#{params[:query]}%")
    end
  end

  private

  def tool_params
    params.require(:tool).permit(:name, :price, :description, :photo, :localisation)
  end
end
