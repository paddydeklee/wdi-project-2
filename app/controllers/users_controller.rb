class UsersController < ApplicationController

  def index
    @users = User.all
  end 

  def doctors
    @users = User.all.where(role: "doctor")
  end 

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end

  def delete
  end

end