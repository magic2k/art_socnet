class RestaurantTypes < ActiveRecord::Base
  belongs_to :restaurant

  validates :restaurant_id, presence: true, uniqueness: true
end
