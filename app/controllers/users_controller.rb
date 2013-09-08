class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :delete] #destroy?

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
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # sign_in @user
      flash[:success] = "Профиль обновлен"  
      redirect_to @user
    else
      render 'edit'  
    end  
  end  

  def show
      @user = User.find(params[:id])

      if @user.usr_type == 'showman'
        @showman_types = @user.showman_type.to_types_array(@user.showman_type)
      elsif @user.usr_type == 'restaurant'
        @restaurant = @user.restaurant      
        @restaurant_types = @restaurant.restaurant_type.to_types_array(@restaurant.restaurant_type)
        @cuisines = @restaurant.cuisine.to_types_array(@restaurant.cuisine)
      end
  end

  #def after_sign_out_path_for(resource_name)
    #request.referrer
  #  redirect_to :show
  #end

  private   
  def user_params
    params.require(:user)
      .permit(:firstname, :lastname,
              :avatar,
              :email,
              :city,
              :country,
              :skype, :vkontakte, :odkl, :twitter,
              :phone)
              # :password, :password_confirmation,
              # :unconfirmed_email)
  end

end
