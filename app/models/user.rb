class User < ActiveRecord::Base
  #attr_accessible :name, :email, :bartender, :emcee, :illusionist, :dj, :guest, :admin,
  #                :user_type, :city, :country, :languages

  has_one :restaurant, dependent: :destroy
  has_one :user_type,  dependent: :destroy

  serialize :languages, Array
#has_secure_password
  validates :email, presence: true, uniqueness: true
end
