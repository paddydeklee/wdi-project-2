class EnquiriesController < ApplicationController

  def new
    @user = User.find(params[:user_id])
    @enquiry = Enquiry.new
  end

end
