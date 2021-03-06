require_relative 'acceptance_helper'

feature 'User sign in', %q{
  In order to be able to ask question
  As an user
  I want to able to sign in
} do 

  given(:user) { create(:user) } #User.create!(email: 'user@test.com', password: '12345678')

  scenario 'Registered user try to sign in' do
    sign_in(user)
    #save_and_open_page
   

    expect(page).to have_content 'Signed in successfully.'
    expect(current_path).to eq root_path
  end
  
  scenario 'Non-registred user try sign in' do
    visit new_user_session_path # or '/sign_in'
    fill_in 'Email', with: 'wrong@test.com'
    fill_in 'Password', with: '12345678'
    click_on 'Log in'
    
    expect(page).to have_content 'Invalid Email or password. Log in Email Password Remember me Sign up Forgot your password?'
    expect(current_path).to eq new_user_session_path

  end
end