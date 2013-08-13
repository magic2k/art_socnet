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
      render "step_#{@user.usr_type}"
    else
      redirect_to after_signup_step_2
    end
  end

  def step_guest
    @user = current_user
  end

  def step_guest_update
    @user = current_user
  end

  def step_showman
    @user = current_user
    @user.user_types.build
  end

  def step_showman_update
    @user = current_user
  end


  def step_restaurant
    @user = current_user
    #end
  end

  def step_restaurant_update
    @user = current_user
    #if @user.update_attributes(user_params)
    #  render @user
    #else
    #  render 'step_3'
    #end
  end


  private
  def user_params
    params.require(:user).permit(:usr_type)
  end

  def user_completed?
    if current_user.completed
      redirect_to root_path
    end
  end
end
