class ProfessionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profession, only: [:show, :edit, :update, :destroy]

  def index
    @professions = Profession.all.paginate(page:params[:page], per_page: 10)
  end

  def new
  end

  def edit
  end

  def show
  end

  def create
    @profession = Profession.new(profession_params)

    if @profession.save
      redirect_to @profession, notice: "Profesión creada exitosamente"
    else
      render :new
    end
  end

  def update
    if @profession.update(profession_params)
      redirect_to @profession, notice: "Profesión actualizada exitosamente"
    else
      render :edit
    end
  end

  def destroy
    @profession.destroy

    redirect_to professions_url, notice: "Profesión eliminada exitosamente"
  end

  private

  def set_profession
    @profession = Profession.find(params[:id])
  end

  def profession_params
    params.require(:profession).permit(:title, :description)
  end
end
