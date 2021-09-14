class ProyectsController < ApplicationController
  def index
    if params[:state].present?
      @proyects = Proyect.where('state = ?', params[:state])
    else
      @proyects = Proyect.all
    end
  end

  def new
    @proyect = Proyect.new
  end

  def create
    
    @proyect = Proyect.create(proyect_params)
    if @proyect.save
      redirect_to root_path, notice: "Se guardado el proyecto correctamente"
    else
      redirect_to root_path, alert: "No se pudo guardar el proyecto"
    end
  end
  
  private

  def proyect_params
    params.require(:proyect).permit(:name, :description, :state, :initial_date, :finish_date)
  end
end
