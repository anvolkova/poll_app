class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :team_name, counter_cache: true
  validates :user_id, uniqueness: { scope: :team_name_id }
end
