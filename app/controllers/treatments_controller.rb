class TreatmentsController < ApplicationController
  before_action :set_treatment, only: [:show, :accept]

  def new
    @consultation = Consultation.find(params[:consultation_id])
    @treatment = Treatment.new
  end

  def create
    @consultation = Consultation.find(params[:consultation_id])
    @treatment = Treatment.new(treatment_params)
    @treatment.consultation_id = @consultation.id
    @treatment.patient_id = @consultation.user_id
    @treatment.doctor_id = @consultation.doctor_id

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

  def pending_treatments
  end

  def doctor_pending_treatments
    # current_user.treatments_as_doctor
    # byebug
    # @doctor = current_user
    # @pending_consultations = current_user.consultations_as_doctor.each do |consultation| consultation.treatment.accepted==true 
    # end
  end



  def accept
    @treatment.accept!
    flash[:success] = "You let your doctor know you accepted the treatment!"
    redirect_to :back
  end

  private
    def set_treatment
      @treatment = Treatment.find(params[:id])
    end

    def treatment_params
      params.require(:treatment).permit(:consultation_id, :treatment_type_id, :treatment_name, :treatment_for, :treatment_quantity)
    end


end
