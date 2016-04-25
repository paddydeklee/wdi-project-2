class ConsultationsController < ApplicationController

  def index
    @consultations = Consultation.all
  end

  def new
    @consultation = Consultation.new
  end

  def show
    @consultation = Consultation.find(params[:id])
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
  def consultation_params
    params.require(:consultation).permit(:type_of, :brief, :image, :doctor)
  end
end
