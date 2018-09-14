class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #EMAIL_REGEX = /\A[^@\s]+@bugcrowd.com\z/

  has_many :team_names, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true
  #validates :email, format: { with: EMAIL_REGEX }
  validates :username, presence: true, uniqueness: true

end
