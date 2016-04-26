class TreatmentsController < ApplicationController


  #constants
  TREATMENTTYPES = ['drugs', 'surgery', 'therapy', 'other']

  def new
    @consultation = Consultation.find(params[:consultation_id])
    @treatment = Treatment.new
  end

  def create
      @consultation = Consultation.find(params[:consultation_id])
      @treatment = @consultation.enquiries.new(treatment_params)
      @treatment.sender_id = current_user.id
      @treatment.receiver_id = @consultation.user.id
      
      if @treatment.save
          flash[:success] = "Your treatment was made successfully"
          redirect_to consultations_path
      else
          flash[:danger] = "Your treatment was not sent"
          redirect_to consultations_path
      end
  end


  private
  def enquiry_params
      params.require(:enquiry).permit(:consultation_id, :treatment_type, :treatment_name, :treatment_for, :treatment_quantity)
  end


end
