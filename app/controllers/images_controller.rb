class ImagesController < ApplicationController

  def new
    @album = Album.find(params[:id])
    @user = User.find(@album.user_id)
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      flash[:success] = "Фотография добавлена"
      redirect_to user_albums_path
    end
    flash.now[:danger] = "Не удалось сохранить изображение"
    render 'edit'
  end

  def edit
    @album = Album.find(params[:id])
    @user = User.find(@album.user_id)
    @image = Image.new #???
  end

  def update
    @image = Image.new(image_params)
    if @image.save
      flash[:success] = "Фотография добавлена"
      redirect_to user_albums_path
    end
    flash.now[:danger] = "Не удалось сохранить изображение"
    render 'edit'
  end

  def destroy

  end

  private
  def image_params
    params.require(:image).permit(:album_id, :image)
  end

end