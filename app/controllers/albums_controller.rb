class AlbumsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @user = User.find(params[:user_id])
    # @user = current_user
    @albums = @user.albums
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    @album.user_id = params[:user_id]
    if @album.save
      flash[:success] = "Альбом создан"
      redirect_to user_albums_path
    else
      flash.now[:danger] = "не удалось создать альбом"
      render 'new'
    end
  end

  def show
    @album = Album.find(params[:id])
    @images = Image.where(album_id: @album)
  end

  def edit
    @album = Album.find(params[:id])
    @user = User.find(@album.user_id)
  end

  def update

  end

  def destroy
    album_for_delete = Album.find(params[:id])
    album_for_delete.destroy
    flash[:success] = 'Альбом удален'
    redirect_to user_albums_path
  end

  private
  def album_params
    # params.require(:album).permit(:user_id, :image_id, :album_name, :cover_id)
    params.require(:album).permit(:user_id, :album_name, :cover_id)
  end
end
