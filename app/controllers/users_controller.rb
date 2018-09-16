class UsersController < ApplicationController
  def names
    @names = current_user.team_names
  end
end
