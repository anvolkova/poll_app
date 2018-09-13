class TeamNamesController < ApplicationController

  before_action :authenticate_user!
  #user_signed_in?
  def new
    @team_name = TeamName.new
  end

  def create
    @team_name = TeamName.create(team_name_params)
    redirect_to team_names_path
  end

  def index
    @team_names = TeamName.all
  end

  def show
    @team_name = TeamName.find(params[:id])
  end

  def destroy
    TeamName.find(params[:id]).destroy
    flash[:success] = "Team name deleted"
    redirect_to team_names_path
  end

  private
  def team_name_params
    params.require(:team_name).permit(:name)
  end

end
