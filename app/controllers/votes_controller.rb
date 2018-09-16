class VotesController < ApplicationController
  before_action :build_vote, only: :create

  def create
    if @vote.save
      flash[:success] = 'Vote submitted!'
    else
      flash[:error] = 'There was an error submitting your vote'
    end
    redirect_to team_names_path(@vote.team_name)
  end

  private

  def vote_params
    params.permit(:team_name_id)
  end

  def build_vote
    @vote = current_user.votes.build(vote_params)
  end
end
