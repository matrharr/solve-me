class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    flash = {succes: 'You have logged in successfully', danger: 'Invalid email/password combination'}

    if user && user.authenticate(params[:session][:password])
      log_in user
      # params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      # flash[:success] = 'You have logged in successfully'
      flash[:success]
      redirect_back_or user
    else
      # flash[:danger] = 'Invalid email/password combination'
      flash[:danger]
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
