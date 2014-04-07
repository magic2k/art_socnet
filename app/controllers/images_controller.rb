class ImagesController < ApplicationController

  #def new
  #  @album = Album.find(params[:id])
  #  @user = User.find(@album.user_id)
  #  @image = Image.new
  #end

  def create
    @album = Album.find(params[:album_id])
    @user = User.find(@album.user_id)
    @image = Image.new(image_params)
    @image.album_id = @album.id
    if @image.save
      flash[:success] = 'Фотография добавлена'
      redirect_to user_albums_path(@user.id)
    else
      flash.now[:danger] = 'Не удалось сохранить изображение'
      render 'edit'
    end
  end

  def edit
    @album = Album.find(params[:id])
    @user = User.find(@album.user_id)
    @image = Image.new #???
  end

  def update
    @album = Album.find(params[:id])
    @user = User.find(@album.user_id)
    @image = Image.new(image_params)
    if @image.save
      flash[:success] = "Фотография добавлена"
      redirect_to user_albums_path
    end
    flash.now[:danger] = "Не удалось сохранить изображение"
    render 'edit'
  end

  def show
    @image = Image.find(params[:id])
  end

  def destroy
    image_to_del = Image.find(params[:id])
    album = Album.find(image_to_del.album)
    if image_to_del.destroy
      flash[:success] = 'Изображение удалено'
      redirect_to album_path(album)
    end
  end

  private
  def image_params
    params.require(:image).permit(:album_id, :image)
  end

end