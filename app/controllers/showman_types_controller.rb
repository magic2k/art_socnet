class ShowmanTypesController < ApplicationController
  before_action :authenticate_user!, only: [:edit]

  def edit
    @user = User.find(params[:id])
    @showman_type = @user.showman_type
  end

  def update
    @user = current_user
    @showman_type = @user.showman_type

    if @showman_type.update_attributes(showman_params)
      flash[:success] = "Профиль обновлен"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
  def showman_params
    params.require(:showman_type).permit(:emcee, :dj, :bartender, :illusionist, :tamada)
  end
end