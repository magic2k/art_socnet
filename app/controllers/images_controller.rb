class ImagesController < ApplicationController

  def create

  end

  def destroy

  end

  private
  def images_params
    params.require(:image).permit()
  end

end