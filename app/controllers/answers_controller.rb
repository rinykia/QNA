class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_answer, only: :update
  #after_action :publish_answer, only: :create

  respond_to :js
  respond_to :json, only: :create
  
  def create
    @question = Question.find(params[:question_id])
    #@answer = @question.answers.build(answer_params) преобразован в строку ниже
    respond_with(@answer = @question.answers.create(answer_params))
  end

  def update
    #authorize @answer #tсли вкл не работает редактирование
    #@answer = Answer.find(params[:id]) load_answer
    @answer.update(answer_params)
    respond_with @answer
    #@question = @answer.question load_answer
  end

  private
  
  #def publish_answer
  #  PrivatePub.publish_to("/questions/#{question.id}/answers", answer: @answer.to_json) if @answer.valid?
  #end

  def load_answer
    @answer = Answer.find(params[:id])
    @question = @answer.question
  end

  def answer_params
    params.require(:answer).permit(:body, attachments_attributes: [:file])
  end
end

