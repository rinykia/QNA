 require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  let!(:question) {create :question}

  describe 'POST #create' do

    let(:question) { create :question }
    
    context 'with valid attributes' do
      it 'saves the new answer in the database' do
        expect { post :create, answer: attributes_for(:answer), question_id: question, format: :js }.to change(question.answers, :count).by(1) #код который выполняется внутри этого блока изменит Question.count на единицу
      end 

      it 'render nothing' do
        post :create, answer: attributes_for(:answer), question_id: question, format: :js
        expect(response.body).to be_blank
      end     
    end

    context 'with invalid attributes' do
      it 'does not save the answer' do
         expect { post :create, answer: attributes_for(:invalid_answer), question_id: question, format: :js }.to_not change(Answer, :count)
      end

      it 'redirect question show view' do
        post :create, answer: attributes_for(:invalid_answer), question_id: question, format: :js 
        expect(response).to render_template :create
      end
    end
  end
  describe 'PATH #update' do
    let(:answer) {create(:answer, question: question)}

    it 'assigns the requested answer to @answer' do
      patch :update, id: answer, question_id: question, answer: attributes_for(:answer), format: :js
      expect(assigns(:answer)).to eq answer
    end

    it 'assigns the question' do
       patch :update, id: answer, question_id: question, answer: attributes_for(:answer), format: :js
       expect(assigns(:question)).to eq question
    end

    it 'changes answer attributes' do
      patch :update, id: answer, question_id: question, answer: {body: 'new body'}, format: :js
      answer.reload
      expect(answer.body).to eq 'new body'
    end

    it 'render update template answer' do
      patch :update, id: answer, question_id: question, answer: attributes_for(:answer), format: :js
      expect(response).to render_template :update
    end
  end
end
