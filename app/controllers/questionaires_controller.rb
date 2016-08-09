class QuestionairesController < ApplicationController

  def index
    # session[:user_location] is user location
    # helper method filters questionaires from local area
    @questionaires_in_area = helper(userlocation)
    render json: @questionaires_in_area
  end

  def create
    @questionaire = Questionaire.create(questionaire_params)
    
    # Question.create(content: params[:question1], questionaire_id: @questionaire.id)
    # Answer.create(content: params[:correct1], value: 'correct')
    # Answer.create(content: params[:dumb1], value: 'wrong')
    # Answer.create(content: params[:dumbper1], value: 'wrong')

    # Question.create(content: params[:question2], questionaire_id: @questionaire.id)
    # Answer.create(content: params[:correct2], value: 'correct')
    # Answer.create(content: params[:dumb2], value: 'wrong')
    # Answer.create(content: params[:dumbper2], value: 'wrong')

    # Question.create(content: params[:question3], questionaire_id: @questionaire.id)
    # Answer.create(content: params[:correct3], value: 'correct')
    # Answer.create(content: params[:dumb3], value: 'wrong')
    # Answer.create(content: params[:dumbper3], value: 'wrong')

    
    render json: @questionaire      

  end

  def update
  end

  def edit
  end

  def delete
  end

  def show
    @questionaire = Questionaire.find(params[:id])
    render json: @questionaire
  end

  private

    def questionaire_params(params)
      params.require(:questionaire).permit()
    end

end
