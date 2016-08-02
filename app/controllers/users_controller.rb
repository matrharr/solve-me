class UsersController < ApplicationController

  def index
  end

  def create
    @user = User.create(fb_params)
    render json: @user
  end

  def update
  end

  def edit
  end

  def delete
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  private
  
    def user_params(params)
      params.require(:questionaire).permit()
    end


end
