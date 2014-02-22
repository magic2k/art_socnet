class Cuisine < ActiveRecord::Base
  include ModulesHelper
  belongs_to :restaurant

  validates :restaurant_id, presence: true, uniqueness: true
end
