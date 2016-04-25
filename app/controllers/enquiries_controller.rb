class EnquiriesController < ApplicationController

  before_action :set_enquiry, only: [:accept, :reject, :cancel]

  def new
    @user = User.find(params[:user_id])
    @enquiry = Enquiry.new
  end

  def create
      @user = User.find(params[:user_id])
      @enquiry = @user.enquiries.new(enquiry_params)
      @enquiry.sender_id = current_user.id
      @enquiry.receiver_id = @user.id
      
      if @enquiry.save
          flash[:success] = "Your enquiry was made successfully. Your doctor will be in touch shortly to set up an appointment"
          redirect_to users_path
      else
          flash[:danger] = "Your enquiry was not sent"
          redirect_to users_path
      end
  end

  def convert_to_consultation
 
    @enquiry = Enquiry.find(params[:id])
    @user = User.where(id: @enquiry.sender_id)

    @consultation = Consultation.new
    @consultation.doctor    = current_user
    @consultation.user_id   = @enquiry.user_id
    @consultation.type_of   = @enquiry.type_of
    @consultation.brief     = @enquiry.brief
    @consultation.image     = @enquiry.image
    @consultation.status    = @enquiry.status
    
    @consultation.save
  end

  # need to do a reject method for the user where the case goes back to the case pool


  def inbox
  end

  def outbox
  end

  def accept
      @enquiry.accept!
      convert_to_consultation
      flash[:success] = "You accepted an enquiry!"
      redirect_to :back
  end

  def reject
      @enquiry.reject!
     flash[:danger] = "You rejected an enquiry!"
     redirect_to :back
  end

  def cancel
      @enquiry.cancel!
      flash[:info] = "You cancelled an enquiry!"
      redirect_to :back
  end

  private
  def set_enquiry
    @enquiry = Enquiry.find(params[:id])
  end

  def enquiry_params
    params.require(:enquiry).permit(:type_of, :brief, :image, :user_id, :doctor_id)
  end

  def consultation_params
    params.require(:consultation).permit(:type_of, :brief, :image, :user_id, :doctor_id)
  end

end
