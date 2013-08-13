class Restaurant < ActiveRecord::Base
  belongs_to :user
  has_one :cuisine
  has_one :restaurant_type

  validates :name, presence: true, uniqueness: true
  #validates :city, presence: true
  #validates :password, length: {minimum: 6}
  #validates :password_confirmation, presence: true

end
