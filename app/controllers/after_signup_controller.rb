class AfterSignupController < ApplicationController
  before_action :authenticate_user!
  before_action :user_completed?

  def new

  end

  def step_2
    @user = current_user
  end

  def step_2_update
    @user = current_user
    if @user.update_attributes(user_params)
      #render "step_#{@user.usr_type}"
      redirect_to action: "step_#{@user.usr_type}"
    else
      render step_2
    end
  end

  def step_guest
    @user = current_user
  end

  def step_guest_update
    @user = current_user
    if @user.update_attributes(user_params)
      redirect_to action: 'final_step'
    else
      render step_guest
    end
  end

  def step_showman
    @showman_type = current_user.create_showman_type(attributes = {})
  end

  def step_showman_update
    @showman_type = current_user.showman_type
    if @showman_type.update_attributes(showman_params)
      redirect_to action: 'final_step'
    else
      render step_showman
    end

  end


  def step_restaurant
    @restaurant = current_user.create_restaurant
  end

  def step_restaurant_update
    @restaurant = current_user.restaurant
    if @restaurant.update_attributes(restaurant_params)
      redirect_to action: 'step_restaurant_types'
    else
      render step_restaurant
    end
  end

  def step_restaurant_types

  end

  def step_restaurant_types_update

  end

  def step_cuisines

  end

  def step_cuisines_update

  end


  def final_step

  end


  private
  def user_params
    params.require(:user).permit(:usr_type)
  end

  def showman_params
    params.require(:showman_type).permit(:emcee, :dj, :bartender, :illusionist, :tamada)
  end

  def restaurant_params
    params.require(:restaurant).permit(:address, :metro, :tel, :workhours, :delivery, :parking, :wifi, :average_paybill, :max_guests, :halls_number, :about)
  end

  def user_completed?
    if current_user.completed
      redirect_to root_path
    end
  end

end
