class AlbumsController < ApplicationController
	before_action :authenticate_user!, except: :show

  def new
  	@album = Album.new 
  end

  def create
  	@album = Album.new(album_params) 
  	if @album.save
  		flash[:success] = "Альбом создан"
  		redirect_to show_album_path
  	else
  			
  	end	
  end

  def show
  	@album = Album.find(params[:id])
  end

  def edit

  end

  def update
  end

  def delete
  end

  private 
  def album_params
  	params.require(:album).permit(:user_id, :image_id, :album_name, :cover_id)
  end 
end
