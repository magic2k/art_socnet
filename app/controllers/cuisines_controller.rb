class CuisinesController < ApplicationController
  before_action :authenticate_user!, only: [:edit] #update

  def edit
    @user = User.find(params[:id])
    @cuisine = @user.restaurant.cuisine
  end

  def update
    @user = current_user
    @cuisine = @user.restaurant.cuisine

    if @cuisine.update_attributes(cuisine_params)
      flash[:success] = "Профиль обновлен"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
  def cuisine_params
    params.require(:cuisine).permit(:european,
                                    :chinese,
                                    :author,
                                    :azerbaijanian,
                                    :armenian,
                                    :vietnam,
                                    :thai,
                                    :indian,
                                    :indonesian,
                                    :japan,
                                    :international,
                                    :mexican,
                                    :uzbekian,
                                    :germanian,
                                    :american,
                                    :french,
                                    :italian,
                                    :mediterranian,
                                    :ukrainian,
                                    :czech,
                                    :turkish,
                                    :georgian,
                                    :arab,
                                    :korean,
                                    :panazian)
  end
end
