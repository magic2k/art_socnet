class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    #@user = User.new(params[:user])
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User succesfully created"
      redirect_to show_user_path
    end
  end

  def show

  end

  private
  def user_params
    params.require(:user)
      .permit(:firstname, :lastname,
              :email, :bartender,
              :emcee, :illusionist,
              :dj, :guest,
              :user_type, :city,
              :country, :languages,
              :password, :password_confirmation,
              :unconfirmed_email)
  end

end
