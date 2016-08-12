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
    @updated_user = User.find_by(access_token: params[:access_token])
    if @updated_user.update(user_params)
      render text: "Account has been updated successfully", status: 200
    else
      render json: @updated_user.errors, status: 422
    end
  end

  def edit
    @user = User.find_by(access_token: params[:access_token])
    render json: @user
  end

  def destroy
    user = User.find_by(access_token: params[:access_token])
    user.destroy
    render text: 'Account has been successfully deleted'
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
