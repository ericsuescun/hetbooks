class SpecialitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_speciality, only: [:show, :edit, :update, :destroy]

  def index
    @specialities = Speciality.all.paginate(page:params[:page], per_page: 10)
  end

  def new
  end

  def edit
  end

  def show
  end

  def create
    @speciality = Speciality.new(speciality_params)

    if @speciality.save
      redirect_to @speciality, notice: "Especialidad creada exitosamente"
    else
      render :new
    end
  end

  def update
    if @speciality.update(speciality_params)
      redirect_to @speciality, notice: "Especialidad actualizada exitosamente"
    else
      render :edit
    end
  end

  def destroy
    @speciality.destroy

    redirect_to specialities_url, notice: "Especialidad eliminada exitosamente"
  end

  private

  def set_speciality
    @speciality = Speciality.find(params[:id])
  end

  def speciality_params
    params.require(:speciality).permit(:title, :description)
  end
end