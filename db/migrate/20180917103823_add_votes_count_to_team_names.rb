class AddVotesCountToTeamNames < ActiveRecord::Migration[5.2]
  def change
    add_column :team_names, :votes_count, :integer, default: 0, null: false

    # Update the counter for existing records
    TeamName.find_each { |team_name| TeamName.reset_counters(team_name.id, :votes) }
  end
end
