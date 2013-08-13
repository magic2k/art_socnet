class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :delete]

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

  def edit

  end

  def show
    if params[:id].nil?
      @user = User.find(params[:id])
    else
      redirect_to root_path
    end
  end

  #def after_sign_out_path_for(resource_name)
    #request.referrer
  #  resirect_to :show
  #end

  private
  def user_params
    params.require(:user)
      .permit(:firstname, :lastname,
              :email,
              :guest,
              :user_type,
              :city,
              :country,
              :languages,
              :password, :password_confirmation,
              :unconfirmed_email)
  end

end
