class SessionsController < ApplicationController
  def new
  end

  def create
    @user.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      if @user.type == "Student"
        redirect_to appointments_path
      else
        redirect_to user_path(@user)
      end
    else
      redirect_to root_path
    end
  end

  def destroy
  end
end
