class TeamNamesController < ApplicationController

  def new
    @team_name = TeamName.new
  end

  def create
    @team_name = TeamName.create(team_name_params)
    redirect_to root_path
  end

  def index
    @team_names = TeamName.all
    #@team_name = TeamName.find(params[:id])
  end

  private
  def team_name_params
    params.require(:team_name).permit(:name)
  end

end
