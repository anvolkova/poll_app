class TeamName < ApplicationRecord
  belongs_to :user
  has_many :votes, dependent: :destroy
  validates :name, presence: true, length: { minimum: 3, maximum: 20 }
  scope :most_voted, -> { order(votes_count: :desc) }
end
