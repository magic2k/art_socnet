class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable

  has_one :restaurant, dependent: :destroy
  has_one :showman_type,  dependent: :destroy

  serialize :languages, Array
#has_secure_password
  validates :email, presence: true, uniqueness: true
  #validates :password, presence: true
  #validates :password_confirmation, presence: true
  #validates :password_digest, presence: true
end
