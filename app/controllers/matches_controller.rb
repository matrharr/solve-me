class MatchesController < ApplicationController

  def index
    @user = User.find(session[:user_id])
    # helper method to find takers/makers
  end

  
  def delete
  end

  private
  
    def matches_params(params)
      params.require(:questionaire).permit()
    end


end
