class PicturesController < ApplicationController
  before_action :authenticate_user!

  def create
    @book = Book.find(params[:book_id])

    unless pictures_params[:image] == ""
      if @book.pictures.create!(pictures_params)
        redirect_to @book, notice: "Imagen cargada!"
      else
        redirect_to @book, notice: "No se puedo cargar la imagen!"
      end


    else
      redirect_to @book, notice: "Sin referencia de imagen! Escoge alguna foto por favor."

    end
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def destroy
    picture = Picture.find(params[:id])
    picture.destroy
    redirect_to book_path(picture.book), notice: "La imagen fue eliminada con éxito"
  end

  private
    def pictures_params
      params.require(:picture).permit(:image, :title, :description)
    end


end
