require 'rails_helper'
require 'spec_helper'

describe 'Question API' do 
  describe 'GET /index' do
    #let(:do_request) {get '/api/v1/questions', format: :json} #заменено внизу
    #let(:api_path) {'/api/v1/questions'}
    it_behaves_like "API Authenticable"
    #context 'unauthorized' do перенесены в фаил support/shared/api_authorization.rb
    #  it 'returns 401 status if there is no access_token' do
    #    get '/api/v1/questions', format: :json
    #    expect(response.status).to eq 401
    #  end

    #  it 'returns 401 status if there is no access_token is invalid' do
    #    get '/api/v1/questions', format: :json, access_token: '1234'
    #    expect(response.status).to eq 401
    #  end
    #end

    context 'authorized' do
      let(:access_token) {create(:access_token)}
      let!(:questions) {create_list(:question, 2)}
      let(:question){questions.first}
      let!(:answer) {create(:answer, question: question)}

      before {get '/api/v1/questions', format: :json, access_token: access_token.token}

      it 'returns 200 status code' do
        expect(response).to be_success
      end

      it 'returns list of questions' do 
        expect(response.body).to have_json_size(2) #после добавления serializers строка ниже
        #expect(response.body).to have_json_size(2).at_path("questions")
      end

      %w(id title created_at updated_at).each do |attr|
        it "question object contains #{attr}" do
          #question = questions.first вынесли, нужен еще для создания ответов
          expect(response.body).to be_json_eql(question.send(attr.to_sym).to_json).at_path("0/#{attr}") #после добавения serializers строка ниже
          #expect(response.body).to be_json_eql(question.send(attr.to_sym).to_json).at_path("questions/0/#{attr}")
        end
      end 

      context 'answers' do        
        it 'include in question object' do
          expect(response.body).to have_json_size(1).at_path("0/answers")#(строка ниже после добавления serizlizers) у нулевого вопроса в свойстве answers должен быть массив и в нем должен быть 1 елемент
          #expect(response.body).to have_json_size(1).at_path("questions/0/answers")
        end

        %w(id body created_at updated_at).each do |attr|
          it "contains #{attr}" do
            #question = questions.first вынесли, нужен еще для создания ответов
            expect(response.body).to be_json_eql(answer.send(attr.to_sym).to_json).at_path("0/answers/0/#{attr}") #после добавения serializers строка ниже
            #expect(response.body).to be_json_eql(answer.send(attr.to_sym).to_json).at_path("questions/0/answers/0/#{attr}")
          end
        end 
      end 
    end

    def do_request(options = {})
      get '/api/v1/questions', {format: :json}.merge(options)
    end 
  end
end