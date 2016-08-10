class UsersController < ApplicationController

  def create
    p params
    @user = User.new(user_params)
      if @user.save
        render json: @user
      else
        render json: @user.errors, status: 422
      end
  end

  def update
    @updated_user = User.find(session[:user_id])
    @updated_user.update(user_params)
    render json: @updated_user
  end

  def edit
    @user = User.find(session[:user_id])
    render json: @user
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: 'Success Message'
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end


end
