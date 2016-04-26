class ConsultationsController < ApplicationController

  before_action :set_consultation, only: [:accept]

  def index
    @consultations = Consultation.all
  end

  def cases_as_patient
    @consultations = Consultation.all.where(user_id: current_user)
  end

  def cases_as_doctor
    @consultations = Consultation.all.where(doctor_id: current_user)
  end

  def unassigned_cases
    @consultations = Consultation.all.where(doctor_id: nil)
  end

  def accept
    @consultation.doctor_id = current_user.id
    @consultation.accept!

    flash[:success] = "You accepted an consultation! Please get in touch with the patient ASAP"
    redirect_to consultations_path
  end

  def new
    @consultation = Consultation.new
  end

  def show
    @consultation = Consultation.find(params[:id])
    @users = User.where(id: @consultation.user_id)
    @doctor = User.where(id: @consultation.doctor_id)
    @comments = @consultation.comments
    @treatment = @consultation.treatment
  end

  def create
    @consultation = current_user.consultations.new(consultation_params)
    if @consultation.save
      flash[:success] = "Your request for a consultation has been sent"
      redirect_to consultations_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def set_consultation
    @consultation = Consultation.find(params[:id])
  end

  def consultation_params
    params.require(:consultation).permit(:type_of, :brief, :image, :doctor, :user_id)
  end
end
