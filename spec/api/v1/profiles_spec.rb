require 'rails_helper'
require 'spec_helper'

describe 'Profile API' do 
  describe 'GET /me' do
    #let(:do_request) {get '/api/v1/profiles/me', format: :json}
    #let(:api_path) {'/api/v1/profiles/me'}
    it_behaves_like "API Authenticable"
    #context 'unauthorized' do
    #  it 'returns 401 status if there is no access_token' do
    #    get '/api/v1/profiles/me', format: :json
    #    expect(response.status).to eq 401
    #  end

    #  it 'returns 401 status if there is no access_token is invalid' do
    #    get '/api/v1/profiles/me', format: :json, access_token: '1234'
    #    expect(response.status).to eq 401
    #  end
    #end
  

    context 'authorized' do
      let(:me) {create(:user)}
      let(:access_token){create(:access_token, resource_owner_id: me.id)}
      before {get '/api/v1/profiles/me', format: :json, access_token: access_token.token}
    
      it 'returns 200 status' do 
        get '/api/v1/profiles/me', format: :json, access_token: access_token.token
        expect(response).to be_success
      end
     
      it 'contains email' do
        expect(response.body).to be_json_eql(me.email.to_json).at_path('email')
      end
     
      it 'contain id' do
        expect(response.body).to be_json_eql(me.id.to_json).at_path('id')
      end

      it 'contains created_at' do
        expect(response.body).to be_json_eql(me.created_at.to_json).at_path('created_at')
      end

      it 'contains updated_at' do
        expect(response.body).to be_json_eql(me.updated_at.to_json).at_path('updated_at')
      end

      it 'does not contain password' do
        expect(response.body).to_not have_json_path('password')
      end

      it 'does not contain encrypted_password' do
        expect(response.body).to_not have_json_path('encrypted_password')
      end
    end 

    def do_request(options = {})
      get '/api/v1/profiles/me', {format: :json}.merge(options)
    end 
  end
end