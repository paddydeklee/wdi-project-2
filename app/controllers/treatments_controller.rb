class TreatmentsController < ApplicationController


  def new
    @consultation = Consultation.find(params[:consultation_id])
    @treatment = Treatment.new
  end

  def create
    @consultation = Consultation.find(params[:consultation_id])
    @treatment = Treatment.new(treatment_params)
    @treatment.consultation_id = @consultation.id

    if @treatment.save
      flash[:success] = "Your treatment was made successfully"
      redirect_to consultation_path(@consultation)
    else
      flash[:danger] = "Your treatment was not sent"
      redirect_to consultation_path(@consultation)
    end
  end

  def show
  end


  private
  def set_treatment
    @treatment = Treatment.find(params[:id])
  end

  def treatment_params
    params.require(:treatment).permit(:consultation_id, :treatment_type, :treatment_name, :treatment_for, :treatment_quantity)
  end


end
