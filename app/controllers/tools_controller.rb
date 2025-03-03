class ToolsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @tools = Tool.all
  end

  def show
    @tool = Tool.find(params[:id])
  end

end
