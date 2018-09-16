class TeamNamesController < ApplicationController

  before_action :authenticate_user!

  def new
    @team_name = current_user.team_names.new
  end

  def create
    @team_name = current_user.team_names.create(team_name_params)
    if @team_name.save
      redirect_to team_names_path
    else
      render 'new'
    end
  end

  def index
    @team_names = TeamName.all.order(created_at: :desc).limit(20)
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
