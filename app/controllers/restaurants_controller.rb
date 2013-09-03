class RestaurantsController < ApplicationController
before_action :authenticate_user!, only: [:edit]

	def edit
		@user = User.find(params[:id])
		@restaurant = @user.restaurant
	end

	def update
		@user = current_user
		@restaurant = @user.restaurant

		if @restaurant.update_attributes(restaurant_params)
			flash[:success] = "Профиль обновлен"  
      		redirect_to @user	
      	else
      		render 'edit'
		end
	end

	private
	def restaurant_params
    	params.require(:restaurant).permit(:address, :name, :metro, :tel, :workhours, :delivery,
                                       :parking, :wifi, :average_paybill, :max_guests,
                                       :halls_number, :about)
  	end
end