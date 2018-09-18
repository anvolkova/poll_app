class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  EMAIL_REGEX = /\A[a-z\d\-.]+@[a-z\d\-]+\.[a-z]+\z/i

  has_many :team_names, dependent: :destroy
  has_many :votes, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, format: { with: EMAIL_REGEX }
  validates :username, presence: true, uniqueness: true, length: { maximum: 50 }

end
