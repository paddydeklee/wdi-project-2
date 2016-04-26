class TreatmentsController < ApplicationController

  def new
    @consultation = Consultation.find(params[:consultation_id])
    @treatment = Treatment.new
  end


end
