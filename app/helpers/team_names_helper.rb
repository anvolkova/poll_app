module TeamNamesHelper

  def already_voted?(team_name)
    unless current_user.votes.find_by(team_name_id: team_name.id) == nil
      return true
    end
  end
end
