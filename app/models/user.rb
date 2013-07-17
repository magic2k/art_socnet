class User < ActiveRecord::Base
  #attr_accessible :name, :email, :bartender, :emcee, :illusionist, :dj, :guest, :admin,
  #                :user_type, :city, :country, :languages

  serialize :languages, Array
#has_secure_password

end
