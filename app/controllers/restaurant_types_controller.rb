class RestaurantTypesController < ApplicationController
  before_action :authenticate_user!, only: [:edit] #update

  def edit
    @user = User.find(params[:id])
    @restaurant_type = @user.restaurant.restaurant_type
  end

  def update
    @user = current_user
    @restaurant_type = @user.restaurant.restaurant_type

    if @restaurant_type.update_attributes(restaurant_type_params)
      flash[:success] = "Профиль обновлен"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
  def restaurant_type_params
    params.require(:restaurant_type).permit(:bar,
                                            :pub,
                                            :pizza,
                                            :barbeque,
                                            :cafe,
                                            :steakhouse,
                                            :sushi_bar,
                                            :vegan_menu,
                                            :food_court,
                                            :art_cafe)
  end
end
