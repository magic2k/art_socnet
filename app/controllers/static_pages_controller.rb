class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def contacts

  end

  def allusers
  	@users = User.where(usr_type: 'showman')
  end

  def allrestaurants
  	@restaurants = User.where(usr_type: 'restaurant')
  end

end
