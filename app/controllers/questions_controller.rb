class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :load_question, only: [:show, :edit, :update, :destroy] 
  before_action :build_answer, only: :show 

  respond_to :html

  authorize_resource

  def index
    #authorize! :read, Question
    respond_with(@questions = Question.all)
  end

  def show
   # authorize! :read, @question
   # @answer = @question.answers.build
   # @answer.attachments.build перенесен в show
    respond_with @question
  end

  def new 
    #authorize! :create, Question
    #@question.attachments.build перенесен в new
    respond_with(@question = Question.new)
  end

  def edit    
  end

  def create
    respond_with(@question = Question.create(question_params))
  end

  def update
    @question.update(question_params)
    respond_with @question
  end

  def destroy
    #authorize! :destroy, @question
    respond_with(@question.destroy)
  end

  private
  
  #def interpolation_options
  #  { resourse_name: 'New awersome question', time: @question.created_at, user: current_user.email }
  #end

  def load_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:user_id, :title, :body, attachments_attributes: [:file])
  end 

  def build_answer
    @answer = @question.answers.build
  end

  

end
