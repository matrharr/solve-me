class MatchesController < ApplicationController

  def index
    user = User.find(2)
    @makers = user.questionaire_makers
    @takers = user.questionaire_takers

    render json: [@makers, @takers]
    # helper method to find takers/makers
  end

  def create
    user = User.find(2)
    # right or wrong logic
    # maker id hidden field in questionaire form
    @match = Match.new(questionaire_taker_id: user.id, questionaire_maker_id: params[:user_id])
    @match.save
    render json: @match
  end

  def delete

  end

  private
  
    # def matches_params(params)
    #   params.require(:questionaire).permit(:questionaire_maker_id)
    # end


end
