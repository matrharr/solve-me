class QuestionairesController < ApplicationController

  def index
    # session[:user_location] is user location
    # helper method filters questionaires from local area
    @questionaires_in_area = helper(userlocation)
    
    render json: @questionaires_in_area
  end

  def create
    @questionaire = Questionaire.new(questionaire_params)
    @questionaire.user_id = session[:user_id]
    @questionaire.save
    
    render json: @questionaire      

  end

  def update
    @updated_questionaire = Questionaire.find_by(user_id: session[:user_id])
    @updated_questionaire.update(params)
    render json: @updated_questionaire
  end

  def edit
    @questionaire = Questionaire.find_by(user_id:session[:user_id])
    render json: @questionaire
  end

  def destroy
    @questionaire = Questionaire.find_by(user_id:session[:user_id])
    @questionaire.destroy
    render json: "Success Message"
  end

  def show
    @questionaire = Questionaire.find(params[:id])
    render json: @questionaire
  end

  private

    def questionaire_params
      params.require(:questionaire).permit(
       :first_question,
       :first_correct_answer,
       :first_middle_answer,
       :first_wrong_answer,
       :second_question,
       :second_correct_answer,
       :second_middle_answer,
       :second_wrong_answer,
       :third_question,
       :third_correct_answer,
       :third_middle_answer,
       :third_wrong_answer,
        )
    end

end
