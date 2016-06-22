shared_examples_for "API Authenticable" do
  context 'unauthorized' do
    it 'returns 401 status if there is no access_token' do
      #get api_path, format: :json
      do_request
      expect(response.status).to eq 401
    end

    it 'returns 401 status if there is no access_token is invalid' do
      do_request(access_token: '123')
      #get api_path, format: :json, access_token: '1234'
      expect(response.status).to eq 401
    end
  end

  
end