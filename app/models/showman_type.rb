class ShowmanType < ActiveRecord::Base
  include ModulesHelper
  belongs_to :user

  validates :user_id, presence: true, uniqueness: true

end
